import 'package:flemby/domain/entities/public_system_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'public_system_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class PublicSystemInfoModel extends PublicSystemInfo {
  PublicSystemInfoModel({
    required super.localAddress,
    required super.localAddresses,
    required super.wanAddress,
    required super.remoteAddresses,
    required super.serverName,
    required super.version,
    required super.id,
  });

  factory PublicSystemInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PublicSystemInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PublicSystemInfoModelToJson(this);
}
