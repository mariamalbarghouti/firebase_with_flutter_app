// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_tdo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDTO _$$_ProductDTOFromJson(Map<String, dynamic> json) =>
    _$_ProductDTO(
      uid: json['uid'] as String?,
      title: json['title'] as String,
      price: json['price'] as num,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ProductDTOToJson(_$_ProductDTO instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
    };
