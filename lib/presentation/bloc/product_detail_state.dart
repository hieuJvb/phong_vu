import 'package:equatable/equatable.dart';
import 'package:phong_vu/models/product.dart';

abstract class ProductDetailState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final Product product;
  final String selectedColor;
  final String selectedRom;

  ProductDetailLoaded({required this.product
    ,required this.selectedColor,required this.selectedRom,
  });

  @override
  List<Object> get props => [product
    , selectedColor
  ];

  ProductDetailLoaded copyWith({String? selectedColor, String? selectedRom}) {
    return ProductDetailLoaded(
      product: product,
      selectedColor:  selectedColor ?? this.selectedColor,
      selectedRom: selectedRom ?? this.selectedRom,
    );
  }
}

class ProductDetailFailed extends ProductDetailState {
  final String message;

  ProductDetailFailed({required this.message});

  @override
  List<Object> get props => [message];
}

