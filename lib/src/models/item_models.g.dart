// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as String? ?? '',
      itemName: json['title'] as String,
      imgUrl: json['picture'] as String,
      unit: json['unit'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'itemName': instance.itemName,
      'imgUrl': instance.imgUrl,
      'unit': instance.unit,
      'price': instance.price,
      'description': instance.description,
    };
