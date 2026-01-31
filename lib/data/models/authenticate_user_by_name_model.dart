import 'package:flemby/domain/entities/authenticate_user_by_name.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authenticate_user_by_name_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class AuthenticateUserByNameModel extends AuthenticateUserByName {
  AuthenticateUserByNameModel({required super.username, required super.pw});

  factory AuthenticateUserByNameModel.fromEntity(
    AuthenticateUserByName entity,
  ) => AuthenticateUserByNameModel(username: entity.username, pw: entity.pw);

  factory AuthenticateUserByNameModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateUserByNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateUserByNameModelToJson(this);
}
