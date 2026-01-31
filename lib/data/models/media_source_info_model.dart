import 'package:flemby/domain/entities/media_source_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_source_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class MediaSourceInfoModel {
  const MediaSourceInfoModel();

  factory MediaSourceInfoModel.fromEntity(MediaSourceInfo entity) {
    return const MediaSourceInfoModel();
  }

  MediaSourceInfo toEntity() {
    return MediaSourceInfo();
  }

  factory MediaSourceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MediaSourceInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaSourceInfoModelToJson(this);
}
