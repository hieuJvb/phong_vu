// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      supplierRetailPrice: json['supplierRetailPrice'] as String,
      terminalPrice: json['terminalPrice'] as String,
      latestPrice: json['latestPrice'] as String,
      discountAmount: json['discountAmount'] as String,
      discountPercent: Price._toString(json['discountPercent']),
      sellPrice: json['sellPrice'] as String,
      minLatestPrice: json['minLatestPrice'] as String,
      maxLatestPrice: json['maxLatestPrice'] as String,
      bestComboDiscount: json['bestComboDiscount'] as String,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'supplierRetailPrice': instance.supplierRetailPrice,
      'terminalPrice': instance.terminalPrice,
      'latestPrice': instance.latestPrice,
      'discountAmount': instance.discountAmount,
      'discountPercent': instance.discountPercent,
      'sellPrice': instance.sellPrice,
      'minLatestPrice': instance.minLatestPrice,
      'maxLatestPrice': instance.maxLatestPrice,
      'bestComboDiscount': instance.bestComboDiscount,
    };
