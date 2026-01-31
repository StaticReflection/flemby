// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionUserInfoModel _$SessionUserInfoModelFromJson(
  Map<String, dynamic> json,
) => SessionUserInfoModel(
  userId: json['UserId'] as String?,
  userName: json['UserName'] as String?,
  userInternalId: (json['UserInternalId'] as num?)?.toInt(),
);

Map<String, dynamic> _$SessionUserInfoModelToJson(
  SessionUserInfoModel instance,
) => <String, dynamic>{
  'UserId': instance.userId,
  'UserName': instance.userName,
  'UserInternalId': instance.userInternalId,
};
