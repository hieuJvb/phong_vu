import 'package:phong_vu/models/product.dart';
import 'package:phong_vu/service/api_product_detail.dart';

import '../service_locator.dart';

class ProductDetailRepository{

   ProductDetailRepository();

  Future<Product> getProducts() async{
    return await sl<ProductDetailApi>().getProduct();
  }
}