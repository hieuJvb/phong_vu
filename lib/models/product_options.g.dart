// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOptions _$ProductOptionsFromJson(Map<String, dynamic> json) =>
    ProductOptions(
      rows: (json['rows'] as List<dynamic>)
          .map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
    );



Row _$RowFromJson(Map<String, dynamic> json) => Row(
      title: json['title'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => RowOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


RowOption _$RowOptionFromJson(Map<String, dynamic> json) => RowOption(
      label: json['label'] as String,
      selected: json['selected'] as bool,
      sku: json['sku'] as String,
      quantity: (json['quantity'] as num).toInt(),
      url: json['url'] as String,
    );