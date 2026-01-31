import 'package:flemby/domain/entities/transcoding_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transcoding_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class TranscodingInfoModel {
  const TranscodingInfoModel();

  factory TranscodingInfoModel.fromEntity(TranscodingInfo entity) {
    return const TranscodingInfoModel();
  }

  TranscodingInfo toEntity() {
    return TranscodingInfo();
  }

  factory TranscodingInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TranscodingInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TranscodingInfoModelToJson(this);
}
