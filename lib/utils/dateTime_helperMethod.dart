// ===============================
/// month helper function
/// ===============================
///
/// - Converts month number (1–12) into readable text
/// - DateTime.month:
///   1 = January
///   7 = February
///
String monthTitle(int month) {
  const monthTitle = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  return monthTitle[month - 1];
}

/// ===============================
/// Weekday helper function
/// ===============================
///
/// - Converts weekday number (1–7) into readable text
/// - DateTime.weekday:
///   1 = Monday
///   7 = Sunday
///

String weekdayName(int weekday) {
  const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  return days[weekday - 1];
}
