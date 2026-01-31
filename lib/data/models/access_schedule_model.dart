import 'package:flemby/domain/entities/access_schedule.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dynamic_day_of_week_model.dart';

part 'access_schedule_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class AccessScheduleModel {
  final DynamicDayOfWeekModel? dayOfWeek;
  final double? startHour;
  final double? endHour;

  const AccessScheduleModel({this.dayOfWeek, this.startHour, this.endHour});

  factory AccessScheduleModel.fromEntity(AccessSchedule entity) {
    return AccessScheduleModel(
      dayOfWeek: entity.dayOfWeek != null
          ? DynamicDayOfWeekModel.fromEntity(entity.dayOfWeek!)
          : null,
      startHour: entity.startHour,
      endHour: entity.endHour,
    );
  }

  AccessSchedule toEntity() {
    return AccessSchedule(
      dayOfWeek: dayOfWeek?.toEntity(),
      startHour: startHour,
      endHour: endHour,
    );
  }

  factory AccessScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$AccessScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessScheduleModelToJson(this);
}
