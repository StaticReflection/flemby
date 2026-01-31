import 'package:flemby/domain/entities/user_item_share_level.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.pascal)
enum UserItemShareLevelModel {
  none,
  read,
  write,
  manage,
  manageDelete;

  static UserItemShareLevelModel fromEntity(UserItemShareLevel entity) {
    return UserItemShareLevelModel.values.byName(entity.name);
  }

  UserItemShareLevel shareLevelToEntity() {
    return UserItemShareLevel.values.byName(name);
  }

  UserItemShareLevel toEntity() {
    return UserItemShareLevel.values.byName(name);
  }
}
