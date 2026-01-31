import 'package:flemby/domain/entities/sleep_timer_mode.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.pascal)
enum SleepTimerModeModel {
  none,
  afterItem,
  atTime;

  static SleepTimerModeModel fromEntity(SleepTimerMode entity) {
    return SleepTimerModeModel.values.byName(entity.name);
  }

  SleepTimerMode toEntity() {
    return SleepTimerMode.values.byName(name);
  }
}
