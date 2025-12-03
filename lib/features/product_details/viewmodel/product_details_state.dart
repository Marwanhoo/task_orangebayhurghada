import 'package:equatable/equatable.dart';
import 'package:task_orangebayhurghada/data/model/product_model.dart';

abstract class ProductDetailsStates extends Equatable {
  const ProductDetailsStates();
  @override
  List<Object?> get props => [];
}

class ProductDetailsInitialState extends ProductDetailsStates {}

class ProductDetailsLoadingState extends ProductDetailsStates {}

class ProductDetailsSuccessState extends ProductDetailsStates {
  final ProductModel productModel;
  const ProductDetailsSuccessState({required this.productModel});
}

class ProductDetailsFailureState extends ProductDetailsStates {
  final String error;
  const ProductDetailsFailureState({required this.error});
}
