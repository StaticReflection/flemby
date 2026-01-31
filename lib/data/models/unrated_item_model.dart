import 'package:flemby/domain/entities/unrated_item.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.pascal)
enum UnratedItemModel {
  book,
  channelContent,
  game,
  liveTvChannel,
  liveTvProgram,
  movie,
  music,
  other,
  series,
  trailer;

  static UnratedItemModel fromEntity(UnratedItem entity) {
    return UnratedItemModel.values.byName(entity.name);
  }

  UnratedItem toEntity() {
    return UnratedItem.values.byName(name);
  }
}
