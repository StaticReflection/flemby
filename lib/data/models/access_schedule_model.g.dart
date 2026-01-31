// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessScheduleModel _$AccessScheduleModelFromJson(Map<String, dynamic> json) =>
    AccessScheduleModel(
      dayOfWeek: $enumDecodeNullable(
        _$DynamicDayOfWeekModelEnumMap,
        json['DayOfWeek'],
      ),
      startHour: (json['StartHour'] as num?)?.toDouble(),
      endHour: (json['EndHour'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AccessScheduleModelToJson(
  AccessScheduleModel instance,
) => <String, dynamic>{
  'DayOfWeek': _$DynamicDayOfWeekModelEnumMap[instance.dayOfWeek],
  'StartHour': instance.startHour,
  'EndHour': instance.endHour,
};

const _$DynamicDayOfWeekModelEnumMap = {
  DynamicDayOfWeekModel.sunday: 'Sunday',
  DynamicDayOfWeekModel.monday: 'Monday',
  DynamicDayOfWeekModel.tuesday: 'Tuesday',
  DynamicDayOfWeekModel.wednesday: 'Wednesday',
  DynamicDayOfWeekModel.thursday: 'Thursday',
  DynamicDayOfWeekModel.friday: 'Friday',
  DynamicDayOfWeekModel.saturday: 'Saturday',
  DynamicDayOfWeekModel.everyday: 'Everyday',
  DynamicDayOfWeekModel.weekday: 'Weekday',
  DynamicDayOfWeekModel.weekend: 'Weekend',
};
