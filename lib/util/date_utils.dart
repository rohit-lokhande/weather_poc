class DateUtils {
  static toDate(int time) {
    return DateTime.fromMillisecondsSinceEpoch(time, isUtc: true);
  }
}
