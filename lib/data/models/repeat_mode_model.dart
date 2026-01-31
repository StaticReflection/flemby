import 'package:flemby/domain/entities/repeat_mode.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.pascal)
enum RepeatModeModel {
  repeatNone,
  repeatAll,
  repeatOne;

  static RepeatModeModel fromEntity(RepeatMode entity) {
    return RepeatModeModel.values.byName(entity.name);
  }

  RepeatMode toEntity() {
    return RepeatMode.values.byName(name);
  }
}
