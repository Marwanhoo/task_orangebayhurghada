import 'package:bloc/bloc.dart';
import 'package:task_orangebayhurghada/data/repository/repository.dart';
import 'package:task_orangebayhurghada/features/products/viewmodel/products/products_state.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit({required this.repository}) : super(ProductsInitialState());

  final Repository repository;

  Future<void> getProducts() async {
    emit(ProductsLoadingState());
    final result = await repository.getProducts();
    result.fold(
      (failure) {
        print("=================");
        print(failure);
        emit(ProductsFailureState(
          error: failure.message,
        ));
      },
      (books) => emit(ProductsSuccessState(
        products: books,
      )),
    );
  }
}
