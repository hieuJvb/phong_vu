import 'package:json_annotation/json_annotation.dart';
import 'package:phong_vu/models/price.dart';
import 'package:phong_vu/models/product_detail.dart';
import 'package:phong_vu/models/product_info.dart';
import 'package:phong_vu/models/product_options.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  ProductInfo productInfo;
  ProductDetail productDetail;
  ProductOptions productOptions;
  List<Price> prices;


  Product({
    required this.productInfo,
    required this.productDetail,
    required this.productOptions,
    required this.prices
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

}
