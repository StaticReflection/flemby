import 'package:flemby/domain/entities/dynamic_day_of_week.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.pascal)
enum DynamicDayOfWeekModel {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  everyday,
  weekday,
  weekend;

  static DynamicDayOfWeekModel fromEntity(DynamicDayOfWeek entity) {
    return DynamicDayOfWeekModel.values.byName(entity.name);
  }

  DynamicDayOfWeek toEntity() {
    return DynamicDayOfWeek.values.byName(name);
  }
}
