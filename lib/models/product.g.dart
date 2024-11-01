// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productInfo:
          ProductInfo.fromJson(json['productInfo'] as Map<String, dynamic>),
      productDetail:
          ProductDetail.fromJson(json['productDetail'] as Map<String, dynamic>),
      productOptions: ProductOptions.fromJson(
          json['productOptions'] as Map<String, dynamic>),
      prices: (json['prices'] as List<dynamic>)
          .map((e) => Price.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

