import 'package:flemby/domain/entities/segment_skip_mode.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.pascal)
enum SegmentSkipModeModel {
  showButton,
  autoSkip,
  none;

  static SegmentSkipModeModel fromEntity(SegmentSkipMode entity) {
    return SegmentSkipModeModel.values.byName(entity.name);
  }

  SegmentSkipMode toEntity() {
    return SegmentSkipMode.values.byName(name);
  }
}
