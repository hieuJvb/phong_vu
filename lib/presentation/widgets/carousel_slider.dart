import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phong_vu/presentation/bloc/product_detail_cubit.dart';
import 'package:phong_vu/presentation/bloc/product_detail_state.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({super.key});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) => ProductDetailCubit()..getProductDetail(),
      child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductDetailFailed) {
            return const Text("Lấy dữ liệu về bị lỗi");
          } else if (state is ProductDetailLoaded) {
            final images = state.product.productDetail.images;

            return Column(
              children: [
                carousel_slider.CarouselSlider(
                    items: images.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: CachedNetworkImage(
                              imageUrl: image.url,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, err) => const Center(
                                child: Icon(Icons.error_outline),
                              ),
                            ),
                          );
                        },
                      );
                    }) // Hiển thị ảnh từ URL
                        .toList(),
                    options: carousel_slider.CarouselOptions(
                      animateToClosest: true,
                      height: media.height * 0.4,
                      autoPlay: true,
                      viewportFraction: 1,
                      aspectRatio: 16/9,

                      initialPage: 0,
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      autoPlayAnimationDuration: const Duration(milliseconds: 200),
                      scrollPhysics: const BouncingScrollPhysics(),

                    )),

              ],
            );
          } else{
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
