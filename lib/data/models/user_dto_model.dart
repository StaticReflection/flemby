import 'package:flemby/domain/entities/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user_configuration_model.dart';
import 'user_policy_model.dart';
import 'user_link_type_model.dart';
import 'user_item_share_level_model.dart';

part 'user_dto_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class UserDtoModel {
  final String? name;
  final String? serverId;
  final String? serverName;
  final String? prefix;
  final String? connectUserName;
  final DateTime? dateCreated;
  final UserLinkTypeModel? connectLinkType;
  final String? id;
  final String? primaryImageTag;
  final bool? hasPassword;
  final bool? hasConfiguredPassword;
  final bool? enableAutoLogin;
  final DateTime? lastLoginDate;
  final DateTime? lastActivityDate;
  final UserConfigurationModel? configuration;
  final UserPolicyModel? policy;
  final double? primaryImageAspectRatio;
  final UserItemShareLevelModel? userItemShareLevel;

  const UserDtoModel({
    this.name,
    this.serverId,
    this.serverName,
    this.prefix,
    this.connectUserName,
    this.dateCreated,
    this.connectLinkType,
    this.id,
    this.primaryImageTag,
    this.hasPassword,
    this.hasConfiguredPassword,
    this.enableAutoLogin,
    this.lastLoginDate,
    this.lastActivityDate,
    this.configuration,
    this.policy,
    this.primaryImageAspectRatio,
    this.userItemShareLevel,
  });

  factory UserDtoModel.fromEntity(UserDto entity) {
    return UserDtoModel(
      name: entity.name,
      serverId: entity.serverId,
      serverName: entity.serverName,
      prefix: entity.prefix,
      connectUserName: entity.connectUserName,
      dateCreated: entity.dateCreated,
      connectLinkType: entity.connectLinkType != null
          ? UserLinkTypeModel.fromEntity(entity.connectLinkType!)
          : null,
      id: entity.id,
      primaryImageTag: entity.primaryImageTag,
      hasPassword: entity.hasPassword,
      hasConfiguredPassword: entity.hasConfiguredPassword,
      enableAutoLogin: entity.enableAutoLogin,
      lastLoginDate: entity.lastLoginDate,
      lastActivityDate: entity.lastActivityDate,
      configuration: entity.configuration != null
          ? UserConfigurationModel.fromEntity(entity.configuration!)
          : null,
      policy: entity.policy != null
          ? UserPolicyModel.fromEntity(entity.policy!)
          : null,
      primaryImageAspectRatio: entity.primaryImageAspectRatio,
      userItemShareLevel: entity.userItemShareLevel != null
          ? UserItemShareLevelModel.fromEntity(entity.userItemShareLevel!)
          : null,
    );
  }

  UserDto toEntity() {
    return UserDto(
      name: name,
      serverId: serverId,
      serverName: serverName,
      prefix: prefix,
      connectUserName: connectUserName,
      dateCreated: dateCreated,
      connectLinkType: connectLinkType?.toEntity(),
      id: id,
      primaryImageTag: primaryImageTag,
      hasPassword: hasPassword,
      hasConfiguredPassword: hasConfiguredPassword,
      enableAutoLogin: enableAutoLogin,
      lastLoginDate: lastLoginDate,
      lastActivityDate: lastActivityDate,
      configuration: configuration?.toEntity(),
      policy: policy?.toEntity(),
      primaryImageAspectRatio: primaryImageAspectRatio,
      userItemShareLevel: userItemShareLevel?.toEntity(),
    );
  }

  factory UserDtoModel.fromJson(Map<String, dynamic> json) =>
      _$UserDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoModelToJson(this);
}
