import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:phong_vu/models/price.dart';
import 'package:phong_vu/models/product.dart';
import 'package:phong_vu/models/product_info.dart';
import 'package:phong_vu/service/api_end_point.dart';

import '../models/product_detail.dart';
import '../models/product_options.dart';

final dio = Dio();
class ProductDetailApi{

  Future<Product> getProduct() async {
    try {
      final response = await dio.get(ApiEndPoint.baseUrl);

      if (response.statusCode == 200) {
        final productData = response.data['result']['product'];
        final productInfo = ProductInfo.fromJson(productData['productInfo']);
        final productDetail = ProductDetail.fromJson(productData['productDetail']);
        final productOptions = ProductOptions.fromJson(productData['productOptions']);
        final productPrice = (productData['prices'] as List<dynamic>)
            .map((price) => Price.fromJson(price as Map<String, dynamic>))
            .toList();

        return Product(
          productInfo: productInfo,
          productDetail: productDetail,
          productOptions: productOptions,
          prices: productPrice,
        );
      } else {
        throw Exception("Failed to load products");
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("Dio error: ${e.message}");
      }
      rethrow;
    }
  }

}