// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:food_app_getx/src/models/item_models.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  String title;
  String id;

  @JsonKey(defaultValue: [])
  List<ItemModel> items;

  @JsonKey(defaultValue: 0)
  int pagination;

  CategoriesModel({
    required this.title,
    required this.id,
    required this.items,
    required this.pagination
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);

  

  @override
  String toString() {
    return 'CategoriesModel(title: $title, id: $id, items: $items, pagination: $pagination)';
  }
}
