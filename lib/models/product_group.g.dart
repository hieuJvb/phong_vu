// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductGroup _$ProductGroupFromJson(Map<String, dynamic> json) => ProductGroup(
      configurations: (json['configurations'] as List<dynamic>)
          .map((e) => Configurations.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProductGroupToJson(ProductGroup instance) =>
    <String, dynamic>{
      'configurations': instance.configurations,
      'name': instance.name,
    };

Configurations _$ConfigurationsFromJson(Map<String, dynamic> json) =>
    Configurations(
      name: json['name'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String,
    );

Map<String, dynamic> _$ConfigurationsToJson(Configurations instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'options': instance.options,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      value: json['value'] as String,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'value': instance.value,
    };
