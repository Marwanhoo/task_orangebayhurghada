import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_orangebayhurghada/core/utils/api_services.dart';
import 'package:task_orangebayhurghada/data/repository/repository.dart';
import 'package:task_orangebayhurghada/data/repository/repository_implementation.dart';
import 'package:task_orangebayhurghada/features/products/viewmodel/products_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Dio>(() {
    return Dio();
  });
  getIt.registerLazySingleton<ApiServices>(() {
    return ApiServices(getIt.get<Dio>());
  });

  getIt.registerLazySingleton<Repository>(() {
    return RepositoryImplementation(getIt.get<ApiServices>());
  });

  getIt.registerFactory<ProductsCubit>(() {
    return ProductsCubit(repository: getIt.get());
  });

  // getIt.registerFactory<BookDetailsCubit>(() {
  //   return BookDetailsCubit(getIt.get());
  // });
}
