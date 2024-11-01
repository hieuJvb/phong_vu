// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) =>
    ProductDetail(
      description: json['description'] as String,
      shortDescription: json['shortDescription'] as String,
      attributeGroups: (json['attributeGroups'] as List<dynamic>)
          .map((e) => AttributeGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      productGroup:
          ProductGroup.fromJson(json['productGroup'] as Map<String, dynamic>),
    );



Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      url: json['url'] as String,
      priority: (json['priority'] as num).toInt(),
      label: json['label'] as String,
    );



AttributeGroup _$AttributeGroupFromJson(Map<String, dynamic> json) =>
    AttributeGroup(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      value: json['value'] as String,
      priority: (json['priority'] as num).toInt(),
      parentId: (json['parentId'] as num).toInt(),
    );
