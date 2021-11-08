import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:weather_poc/controller/controller.dart';
import 'package:weather_poc/model/model.dart';
import 'package:weather_poc/styles/styles.dart';
import 'package:weather_poc/util/util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController _globalController = Get.find<GlobalController>();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      LocationData location = await LocationUtil.getLocation();
      _globalController.fetchCurrentWeatherData(location, 'metric');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GlobalController>(
        builder: (controller) {
          return Stack(
            children: [
              _backgroundImage(controller),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white10,
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                left: 0,
                right: 0,
                child: Container(
                  child: _topInformationView(controller),
                  padding: const EdgeInsets.all(12),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).padding.bottom + 20,
                left: 0,
                right: 0,
                child: Container(
                  child: _bottomInformationView(
                      controller.weatherMaster.value.temperature),
                  padding: const EdgeInsets.all(12),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _backgroundImage(GlobalController controller) {
    return Image.asset(
      getImagePath(controller.weatherMaster.value.dt),
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget _topInformationView(GlobalController controller) {
    return Column(
      children: [
        Text(
          controller.weatherMaster.value.name ?? '',
          style: TextStyles.heading2,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 80,
          child: Image.network(
            'http://openweathermap.org/img/wn/${controller.weather.value.icon}@2x.png',
            color: ColorPallet.white,
            loadingBuilder: (context, widget, __) {
              return widget;
            },
            errorBuilder: (_, __, ___) {
              return Container();
            },
          ),
        ),
        Text(
          (controller.weatherMaster.value.temperature != null)
              ? '${controller.weatherMaster.value.temperature!.temp} \u2103'
              : '-',
          style: TextStyles.heading1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _bottomInformationView(Temperature? temperature) {
    if (temperature != null) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _titleValueView('Min', '${temperature.tempMin ?? '-'} \u2103'),
            Container(
              color: Colors.white,
              width: 1,
              height: 40,
            ),
            _titleValueView('Max', '${temperature.tempMax ?? '-'} \u2103'),
            Container(
              color: Colors.white,
              width: 1,
              height: 40,
            ),
            _titleValueView('Pressure', '${temperature.pressure ?? '-'}'),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Column _titleValueView(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyles.heading4,
          textAlign: TextAlign.center,
        ),
        Text(
          value,
          style: TextStyles.heading5,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  String getImagePath(DateTime? dt) {
    String path = Assets.backgroundCloudy;
    if (dt != null) {
      int hours = dt.hour;
      if (hours >= 1 && hours <= 12) {
        path = Assets.backgroundCloudy;
      } else if (hours >= 12 && hours <= 21) {
        path = Assets.backgroundSunny;
      } else if (hours >= 21 && hours <= 24) {
        path = Assets.backgroundNight;
      }
    }
    return path;
  }
}
