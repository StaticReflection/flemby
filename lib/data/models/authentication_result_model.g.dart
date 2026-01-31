// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationResultModel _$AuthenticationResultModelFromJson(
  Map<String, dynamic> json,
) => AuthenticationResultModel(
  user: UserDtoModel.fromJson(json['User'] as Map<String, dynamic>),
  sessionInfo: SessionInfoModel.fromJson(
    json['SessionInfo'] as Map<String, dynamic>,
  ),
  accessToken: json['AccessToken'] as String,
  serverId: json['ServerId'] as String,
);

Map<String, dynamic> _$AuthenticationResultModelToJson(
  AuthenticationResultModel instance,
) => <String, dynamic>{
  'User': instance.user,
  'SessionInfo': instance.sessionInfo,
  'AccessToken': instance.accessToken,
  'ServerId': instance.serverId,
};
