import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phong_vu/common/font.dart';
import 'package:phong_vu/presentation/bloc/product_detail_cubit.dart';
import 'package:phong_vu/presentation/bloc/product_detail_state.dart';
import 'package:phong_vu/presentation/widgets/attribute_group.dart';
import 'package:phong_vu/presentation/widgets/carousel_slider.dart';
import 'package:phong_vu/presentation/widgets/custom_wrap.dart';
import 'package:phong_vu/presentation/widgets/html_short_d.dart';
import 'package:phong_vu/presentation/widgets/price.dart';
import 'package:phong_vu/presentation/widgets/section_title.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  bool _showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.add_shopping_cart)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: BlocProvider(
        create: (context) => ProductDetailCubit()..getProductDetail(),
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            if (state is ProductDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDetailLoaded) {
              final price = state.product.prices.first;

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: media.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const CarouselSlider(),

                      SectionTitle(title: "MÀU SẮC: ${state.selectedColor}"),

                      Wrap(
                        spacing: media.width * 0.03,
                        runSpacing: 10,
                        children: state
                            .product.productDetail.productGroup.configurations
                            .firstWhere(
                                (config) => config.code == "NL_mausachang")
                            .options
                            .map((option) => GestureDetector(
                                onTap: () {
                                  context
                                      .read<ProductDetailCubit>()
                                      .toggleColor(option.value);
                                },
                                child: CustomWrap(
                                    color: state.selectedColor == option.value
                                        ? Colors.blue
                                        : Colors.grey,
                                    title: option.value)))
                            .toList(),
                      ),

                      SectionTitle(
                          title: "DUNG LƯỢNG (ROM): ${state.selectedRom}"),

                      Wrap(
                        spacing: media.width * 0.03,
                        runSpacing: 10,
                        children: state
                            .product.productDetail.productGroup.configurations
                            .firstWhere(
                              (config) => config.code == "dienthoai_bonhotrong",
                            )
                            .options
                            .map((option) => GestureDetector(
                                onTap: () {
                                  context
                                      .read<ProductDetailCubit>()
                                      .toggleRom(option.value);
                                },
                                child: CustomWrap(
                                    color: state.selectedRom == option.value
                                        ? Colors.blue
                                        : Colors.grey,
                                    title: option.value)))
                            .toList(),
                      ),

                      //Tên điện thoại
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: media.height * 0.01),
                        child: Text(
                            state.product.productDetail.productGroup.name,
                            style: AppFonts.kFontTitle),
                      ),

                      //Giá điện thoại
                      PriceWidget(
                          oldPrice: price.supplierRetailPrice,
                          newPrice: price.latestPrice,
                          discountPercent: price.discountPercent),

                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: media.height * 0.01),
                        child: Text(
                          "Chi tiết sản phẩm",
                          style: AppFonts.kFontTitle,
                        ),
                      ),

                      // Thông số sản phẩm
                      ProductAttributesList(
                        attributeGroups:
                            state.product.productDetail.attributeGroups,
                      ),

                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: media.height * 0.01),
                        child: Text(
                          "Mô tả sản phẩm",
                          style: AppFonts.kFontTitle,
                        ),
                      ),

                      // Mô tả
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: media.height * 0.01),
                        child: HtmlShortD(
                          shortDescription: _showFullDescription
                              ? state.product.productDetail
                                  .description // Hiển thị mô tả dài khi _showFullDescription là true
                              : state.product.productDetail
                                  .shortDescription, // Hiển thị mô tả ngắn khi _showFullDescription là false
                        ),
                      ),

                      // Nút để xem thêm
                      Center(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _showFullDescription =
                                  !_showFullDescription; // Cập nhật trạng thái khi nhấn nút
                            });
                          },
                          child: Text(
                            _showFullDescription ? "Thu gọn" : "Xem thêm",
                            // Thay đổi nhãn nút
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ProductDetailFailed) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
