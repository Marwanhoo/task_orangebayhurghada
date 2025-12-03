import 'package:dartz/dartz.dart';
import 'package:task_orangebayhurghada/core/errors/failure.dart';
import 'package:task_orangebayhurghada/data/model/product_model.dart';

abstract class Repository {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, ProductModel>> getProductDetails({required int id});
}