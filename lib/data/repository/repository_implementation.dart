import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_orangebayhurghada/core/errors/failure.dart';
import 'package:task_orangebayhurghada/core/utils/api_services.dart';
import 'package:task_orangebayhurghada/data/model/product_model.dart';
import 'package:task_orangebayhurghada/data/repository/repository.dart';

class RepositoryImplementation implements Repository {
  final ApiServices apiServices;
  RepositoryImplementation(this.apiServices);
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      var data = await apiServices.getRequestSimple(
        url: "https://task-two-plum-44.vercel.app/api/products/",
      );
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      //return Right(books);
      return right(products);
    } catch (e) {
      print("==========");
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductDetails() async {
    try {
      Map<String, dynamic> data = await apiServices.getRequestSimple(
        url: "https://task-two-plum-44.vercel.app/api/products/6",
      );

      ProductModel productModel = ProductModel.fromJson(data);
      return right(productModel);
    } catch (e) {
      print("==========");
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
