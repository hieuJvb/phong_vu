import 'package:get_it/get_it.dart';
import 'package:phong_vu/repositories/product_detail_repository.dart';
import 'package:phong_vu/service/api_product_detail.dart';

final sl = GetIt.instance;
Future<void> initialDependencies() async {

  sl.registerSingleton<ProductDetailRepository>(ProductDetailRepository());
  sl.registerSingleton<ProductDetailApi>(ProductDetailApi());
}