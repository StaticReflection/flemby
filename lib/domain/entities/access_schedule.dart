import 'package:flemby/domain/entities/dynamic_day_of_week.dart';

class AccessSchedule {
  final DynamicDayOfWeek? dayOfWeek;
  final double? startHour;
  final double? endHour;

  const AccessSchedule({this.dayOfWeek, this.startHour, this.endHour});
}
