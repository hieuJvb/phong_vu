import 'package:json_annotation/json_annotation.dart';

part 'product_group.g.dart';

@JsonSerializable()
class ProductGroup{
  final List<Configurations> configurations;
  final String name;

  ProductGroup({required this.configurations, required this.name});

  factory ProductGroup.fromJson(Map<String, dynamic> json) => _$ProductGroupFromJson(json);

}

@JsonSerializable()
class Configurations{
  final String name;
  final String code;
  final List<Option> options;

  Configurations({required this.name, required this.options, required this.code, });

  factory Configurations.fromJson(Map<String, dynamic> json) => _$ConfigurationsFromJson(json);

}

@JsonSerializable()
class Option{
   final String value;

  Option({required this.value});

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}