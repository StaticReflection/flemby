// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDtoModel _$UserDtoModelFromJson(Map<String, dynamic> json) => UserDtoModel(
  name: json['Name'] as String?,
  serverId: json['ServerId'] as String?,
  serverName: json['ServerName'] as String?,
  prefix: json['Prefix'] as String?,
  connectUserName: json['ConnectUserName'] as String?,
  dateCreated: json['DateCreated'] == null
      ? null
      : DateTime.parse(json['DateCreated'] as String),
  connectLinkType: $enumDecodeNullable(
    _$UserLinkTypeModelEnumMap,
    json['ConnectLinkType'],
  ),
  id: json['Id'] as String?,
  primaryImageTag: json['PrimaryImageTag'] as String?,
  hasPassword: json['HasPassword'] as bool?,
  hasConfiguredPassword: json['HasConfiguredPassword'] as bool?,
  enableAutoLogin: json['EnableAutoLogin'] as bool?,
  lastLoginDate: json['LastLoginDate'] == null
      ? null
      : DateTime.parse(json['LastLoginDate'] as String),
  lastActivityDate: json['LastActivityDate'] == null
      ? null
      : DateTime.parse(json['LastActivityDate'] as String),
  configuration: json['Configuration'] == null
      ? null
      : UserConfigurationModel.fromJson(
          json['Configuration'] as Map<String, dynamic>,
        ),
  policy: json['Policy'] == null
      ? null
      : UserPolicyModel.fromJson(json['Policy'] as Map<String, dynamic>),
  primaryImageAspectRatio: (json['PrimaryImageAspectRatio'] as num?)
      ?.toDouble(),
  userItemShareLevel: $enumDecodeNullable(
    _$UserItemShareLevelModelEnumMap,
    json['UserItemShareLevel'],
  ),
);

Map<String, dynamic> _$UserDtoModelToJson(UserDtoModel instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'ServerId': instance.serverId,
      'ServerName': instance.serverName,
      'Prefix': instance.prefix,
      'ConnectUserName': instance.connectUserName,
      'DateCreated': instance.dateCreated?.toIso8601String(),
      'ConnectLinkType': _$UserLinkTypeModelEnumMap[instance.connectLinkType],
      'Id': instance.id,
      'PrimaryImageTag': instance.primaryImageTag,
      'HasPassword': instance.hasPassword,
      'HasConfiguredPassword': instance.hasConfiguredPassword,
      'EnableAutoLogin': instance.enableAutoLogin,
      'LastLoginDate': instance.lastLoginDate?.toIso8601String(),
      'LastActivityDate': instance.lastActivityDate?.toIso8601String(),
      'Configuration': instance.configuration,
      'Policy': instance.policy,
      'PrimaryImageAspectRatio': instance.primaryImageAspectRatio,
      'UserItemShareLevel':
          _$UserItemShareLevelModelEnumMap[instance.userItemShareLevel],
    };

const _$UserLinkTypeModelEnumMap = {
  UserLinkTypeModel.linkedUser: 'LinkedUser',
  UserLinkTypeModel.guest: 'Guest',
};

const _$UserItemShareLevelModelEnumMap = {
  UserItemShareLevelModel.none: 'None',
  UserItemShareLevelModel.read: 'Read',
  UserItemShareLevelModel.write: 'Write',
  UserItemShareLevelModel.manage: 'Manage',
  UserItemShareLevelModel.manageDelete: 'ManageDelete',
};
