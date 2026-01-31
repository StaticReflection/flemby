import 'package:flemby/domain/entities/emby_account.dart';
import 'package:json_annotation/json_annotation.dart';

part 'emby_account_model.g.dart';

@JsonSerializable()
class EmbyAccountModel extends EmbyAccount {
  EmbyAccountModel({
    required super.name,
    required super.id,
    required super.accessToken,
  });

  factory EmbyAccountModel.fromEntity(EmbyAccount entity) {
    return EmbyAccountModel(
      id: entity.id,
      name: entity.name,
      accessToken: entity.accessToken,
    );
  }

  factory EmbyAccountModel.fromJson(Map<String, dynamic> json) =>
      _$EmbyAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmbyAccountModelToJson(this);
}
