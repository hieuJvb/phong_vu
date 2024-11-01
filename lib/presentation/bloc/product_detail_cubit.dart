import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phong_vu/models/product.dart';
import 'package:phong_vu/presentation/bloc/product_detail_state.dart';
import 'package:phong_vu/repositories/product_detail_repository.dart';
import '../../service_locator.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailInitial());

  Future<void> toggleImage() async {}

  Future<void> getProductDetail() async {
    try {
      emit(ProductDetailLoading());
      final Product product = await sl<ProductDetailRepository>().getProducts();

      emit(ProductDetailLoaded(
        product: product,
        selectedColor: product.productDetail.productGroup.configurations
            .firstWhere((config) => config.code == "NL_mausachang")
            .options[0]
            .value,
        selectedRom: product.productDetail.productGroup.configurations
            .firstWhere((config) => config.code == "dienthoai_bonhotrong")
            .options[0]
            .value,
      ));

    } catch (e) {

      emit(ProductDetailFailed(message: e.toString()));

    }
  }

  void toggleColor(String color) {
    if (state is ProductDetailLoaded) {
      final currentState = state as ProductDetailLoaded;
      emit(currentState.copyWith(selectedColor: color));
    }
  }

  void toggleRom(String rom) {
    if (state is ProductDetailLoaded) {
      final currentState = state as ProductDetailLoaded;
      emit(currentState.copyWith(selectedRom: rom));
    }
  }

}
