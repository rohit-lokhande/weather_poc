class Assets {
  static String _imagePath(String asset) => 'assets/images/$asset';

  static String get backgroundSunny => _imagePath('background_sunny.png');
  static String get backgroundCloudy => _imagePath('background_cloudy.png');
  static String get backgroundNight => _imagePath('background_night.png');
}
