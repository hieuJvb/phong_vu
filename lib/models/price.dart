
import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class Price {
  String supplierRetailPrice;
  String terminalPrice;
  String latestPrice;
  String discountAmount;

  @JsonKey(fromJson: _toString)
  String discountPercent;
  String sellPrice;
  String minLatestPrice;
  String maxLatestPrice;
  String bestComboDiscount;

  Price({
    required this.supplierRetailPrice,
    required this.terminalPrice,
    required this.latestPrice,
    required this.discountAmount,
    required this.discountPercent,
    required this.sellPrice,
    required this.minLatestPrice,
    required this.maxLatestPrice,
    required this.bestComboDiscount,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  static String _toString(dynamic value) => value.toString();

}
