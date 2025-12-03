import 'package:equatable/equatable.dart';
import 'package:task_orangebayhurghada/data/model/product_model.dart';

abstract class ProductsStates extends Equatable {
  const ProductsStates();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsInitialState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsSuccessState extends ProductsStates {
  final List<ProductModel> products;
  const ProductsSuccessState({required this.products});
}

class ProductsFailureState extends ProductsStates {
  final String error;
  const ProductsFailureState({required this.error});
}
