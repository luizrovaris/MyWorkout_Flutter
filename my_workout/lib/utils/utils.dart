class Utils {
  static Map<int, String> getWeekDaysNames() {
    Map<int, String> weekDayMap = {
      1: 'Sun',
      2: 'Mon',
      3: 'Tue',
      4: 'Wed',
      5: 'Thu',
      6: 'Fri',
      7: 'Sat',
    };

    return weekDayMap;
  }
  
  static String getWeekDayName(int day) {
    Map<int, String> weekDayMap = {
      1: 'Sunday',
      2: 'Monday',
      3: 'Tuesday',
      4: 'Wednesday',
      5: 'Thursday',
      6: 'Friday',
      7: 'Saturday',
    };

    return weekDayMap[day].toString();
  }

  static List<Map<String, Object>> getWeekDaysList() {
    List<Map<String, Object>> weekDayMap = [
      {'id': 0, 'name': 'Select'},
      {'id': 1, 'name': 'Sun'},
      {'id': 2, 'name': 'Mon'},
      {'id': 3, 'name': 'Tue'},
      {'id': 4, 'name': 'Wed'},
      {'id': 5, 'name': 'Thu'},
      {'id': 6, 'name': 'Fri'},
      {'id': 7, 'name': 'Sat'},
    ];

    return weekDayMap;
  }
}
