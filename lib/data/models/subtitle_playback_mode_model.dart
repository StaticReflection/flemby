import 'package:flemby/domain/entities/subtitle_playback_mode.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.pascal)
enum SubtitlePlaybackModeModel {
  defaultMode,
  always,
  onlyForced,
  none,
  smart,
  hearingImpaired;

  static SubtitlePlaybackModeModel fromEntity(SubtitlePlaybackMode entity) {
    return SubtitlePlaybackModeModel.values.byName(entity.name);
  }

  SubtitlePlaybackMode toEntity() {
    return SubtitlePlaybackMode.values.byName(name);
  }
}
