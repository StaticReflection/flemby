import 'package:flemby/domain/entities/play_method.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.pascal)
enum PlayMethodModel {
  transcode,
  directStream,
  directPlay;

  static PlayMethodModel fromEntity(PlayMethod entity) {
    return PlayMethodModel.values.byName(entity.name);
  }

  PlayMethod toEntity() {
    return PlayMethod.values.byName(name);
  }
}
