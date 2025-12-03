import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_orangebayhurghada/core/errors/failure.dart';
import 'package:task_orangebayhurghada/core/utils/api_services.dart';
import 'package:task_orangebayhurghada/core/utils/app_strings.dart';
import 'package:task_orangebayhurghada/data/model/banner_model.dart';
import 'package:task_orangebayhurghada/data/model/product_model.dart';
import 'package:task_orangebayhurghada/data/repository/repository.dart';

class RepositoryImplementation implements Repository {
  final ApiServices apiServices;
  RepositoryImplementation(this.apiServices);
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      var data = await apiServices.getRequestSimple(
        url: "${AppStrings.baseUrl}/${AppStrings.api}/${AppStrings.products}/",
      );
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return Right(products);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductDetails({
    required int id,
  }) async {
    try {
      Map<String, dynamic> data = await apiServices.getRequestSimple(
        url:
            "${AppStrings.baseUrl}/${AppStrings.api}/${AppStrings.products}/$id",
      );

      ProductModel productModel = ProductModel.fromJson(data);
      return Right(productModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BannerModel>>> getBanners() async {
    try {
      Map<String, dynamic> data = await apiServices.getRequestSimple(
        url: AppStrings.banners,
      );

      List<BannerModel> banners = [];
      for (var item in data['data']) {
        banners.add(BannerModel.fromJson(item));
      }

      return Right(banners);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
