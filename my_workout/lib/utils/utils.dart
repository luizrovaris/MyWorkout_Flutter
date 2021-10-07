class Utils {
  static Map<int, String> getWeekDaysNames() {
    Map<int, String> weekDayMap = {
      1: 'Monday',
      2: 'Tuesday',
      3: 'Wednesday',
      4: 'Thursday',
      5: 'Friday',
      6: 'Saturday',
      7: 'Sunday',
    };

    return weekDayMap;
  }

  static List<Map<String, Object>> getWeekDaysList() {
    List<Map<String, Object>> weekDayMap = [
      {'id': 0, 'name': 'Select'},
      {'id': 1, 'name': 'Mon'},
      {'id': 2, 'name': 'Tue'},
      {'id': 3, 'name': 'Wed'},
      {'id': 4, 'name': 'Thu'},
      {'id': 5, 'name': 'Fri'},
      {'id': 6, 'name': 'Sat'},
      {'id': 7, 'name': 'Sun'},
    ];

    return weekDayMap;
  }
}
