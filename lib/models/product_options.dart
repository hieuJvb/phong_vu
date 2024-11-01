import 'package:json_annotation/json_annotation.dart';

part 'product_options.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductOptions {
  List<Row> rows;

  ProductOptions({
    required this.rows,
  });

  // Factory method to create an instance from JSON
  factory ProductOptions.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionsFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class Row {
  String title;
  List<RowOption> options;

  Row({
    required this.title,
    required this.options,
  });

  // Factory method to create an instance from JSON
  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class RowOption {
  String label;
  bool selected;
  String sku;
  int quantity;
  String url;

  RowOption({
    required this.label,
    required this.selected,
    required this.sku,
    required this.quantity,
    required this.url,
  });

  // Factory method to create an instance from JSON
  factory RowOption.fromJson(Map<String, dynamic> json) =>
      _$RowOptionFromJson(json);

}
