import 'package:bloc/bloc.dart';
import 'package:task_orangebayhurghada/data/repository/repository.dart';
import 'package:task_orangebayhurghada/features/product_details/viewmodel/product_details_state.dart';

class ProductsCubit extends Cubit<ProductDetailsStates> {
  ProductsCubit({required this.repository})
    : super(ProductDetailsInitialState());

  final Repository repository;

  Future<void> getProducts() async {
    emit(ProductDetailsLoadingState());
    final result = await repository.getProductDetails();
    result.fold(
      (failure) {
        emit(ProductDetailsFailureState(error: failure.message));
      },
      (product) {
        emit(ProductDetailsSuccessState(productModel: product));
      },
    );
  }
}
