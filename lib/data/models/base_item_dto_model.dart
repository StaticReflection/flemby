import 'package:flemby/domain/entities/base_item_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_item_dto_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class BaseItemDtoModel {
  const BaseItemDtoModel();

  factory BaseItemDtoModel.fromEntity(BaseItemDto entity) {
    return const BaseItemDtoModel();
  }

  BaseItemDto toEntity() {
    return BaseItemDto();
  }

  factory BaseItemDtoModel.fromJson(Map<String, dynamic> json) =>
      _$BaseItemDtoModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseItemDtoModelToJson(this);
}
