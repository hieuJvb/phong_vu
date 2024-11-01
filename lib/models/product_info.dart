import 'package:json_annotation/json_annotation.dart';

part 'product_info.g.dart'; // Đảm bảo rằng phần này đúng

@JsonSerializable(explicitToJson: true)
class ProductInfo {
  final String name;

  ProductInfo({required this.name});

  // Đảm bảo rằng bạn sử dụng hàm được tạo ra từ file g.dart
  factory ProductInfo.fromJson(Map<String, dynamic> json) => _$ProductInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInfoToJson(this);
}
