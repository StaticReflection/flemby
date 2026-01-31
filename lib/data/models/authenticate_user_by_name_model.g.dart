// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_user_by_name_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateUserByNameModel _$AuthenticateUserByNameModelFromJson(
  Map<String, dynamic> json,
) => AuthenticateUserByNameModel(
  username: json['Username'] as String,
  pw: json['Pw'] as String,
);

Map<String, dynamic> _$AuthenticateUserByNameModelToJson(
  AuthenticateUserByNameModel instance,
) => <String, dynamic>{'Username': instance.username, 'Pw': instance.pw};
