import 'package:flemby/domain/entities/authentication_result.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user_dto_model.dart';
import 'session_info_model.dart';

part 'authentication_result_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class AuthenticationResultModel {
  final UserDtoModel user;
  final SessionInfoModel sessionInfo;
  final String accessToken;
  final String serverId;

  const AuthenticationResultModel({
    required this.user,
    required this.sessionInfo,
    required this.accessToken,
    required this.serverId,
  });

  factory AuthenticationResultModel.fromEntity(AuthenticationResult entity) {
    return AuthenticationResultModel(
      user: UserDtoModel.fromEntity(entity.user),
      sessionInfo: SessionInfoModel.fromEntity(entity.sessionInfo),
      accessToken: entity.accessToken,
      serverId: entity.serverId,
    );
  }

  AuthenticationResult toEntity() {
    return AuthenticationResult(
      user: user.toEntity(),
      sessionInfo: sessionInfo.toEntity(),
      accessToken: accessToken,
      serverId: serverId,
    );
  }

  factory AuthenticationResultModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResultModelToJson(this);
}
