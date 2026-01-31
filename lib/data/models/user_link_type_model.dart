import 'package:flemby/domain/entities/user_link_type.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.pascal)
enum UserLinkTypeModel {
  linkedUser,
  guest;

  static UserLinkTypeModel fromEntity(UserLinkType entity) {
    return UserLinkTypeModel.values.byName(entity.name);
  }

  UserLinkType toEntity() {
    return UserLinkType.values.byName(name);
  }
}
