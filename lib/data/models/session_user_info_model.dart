import 'package:flemby/domain/entities/session_user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_user_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class SessionUserInfoModel {
  final String? userId;
  final String? userName;
  final int? userInternalId;

  const SessionUserInfoModel({this.userId, this.userName, this.userInternalId});

  factory SessionUserInfoModel.fromEntity(SessionUserInfo entity) {
    return SessionUserInfoModel(
      userId: entity.userId,
      userName: entity.userName,
      userInternalId: entity.userInternalId,
    );
  }

  SessionUserInfo toEntity() {
    return SessionUserInfo(userId, userName, userInternalId);
  }

  factory SessionUserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SessionUserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionUserInfoModelToJson(this);
}
