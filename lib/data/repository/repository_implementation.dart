import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_orangebayhurghada/core/errors/failure.dart';
import 'package:task_orangebayhurghada/core/utils/api_services.dart';
import 'package:task_orangebayhurghada/core/utils/app_strings.dart';
import 'package:task_orangebayhurghada/data/model/product_model.dart';
import 'package:task_orangebayhurghada/data/repository/repository.dart';

class RepositoryImplementation implements Repository {
  final ApiServices apiServices;
  RepositoryImplementation(this.apiServices);
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      var data = await apiServices.getRequestSimple(
        url:
            "https://task-two-plum-44.vercel.app/api/products/",
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

  // @override
  // Future<Either<Failure, BookModel>> getBookDetails({
  //   required String id,
  // }) async {
  //   try {
  //     var data = await apiServices.getRequestSimple(
  //       url: "https://www.googleapis.com/books/v1/volumes/${id}",
  //     );
  //
  //     return right(BookModel.fromJson(data));
  //   } catch (e) {
  //     print("===============");
  //     print(e);
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioException(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, List<BookModel>>> getSimilarBooks({
  //   required String subject,
  // }) async {
  //   try {
  //     var data = await apiServices.getRequestSimple(
  //       url:
  //           "${AppStrings.baseUrl}volumes?q=subject:$subject&Filtering=free-ebooks",
  //     );
  //     List<BookModel> books = [];
  //     for (var item in data['items']) {
  //       books.add(BookModel.fromJson(item));
  //     }
  //     //return Right(books);
  //     return right(books);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioException(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
  //   try {
  //     var data = await apiServices.getRequestSimple(
  //       url:
  //           "https://www.googleapis.com/books/v1/volumes?q=subject:programming&Filtering=free-ebooks&Sorting=newest",
  //     );
  //     List<BookModel> books = [];
  //     for (var item in data['items']) {
  //       books.add(BookModel.fromJson(item));
  //     }
  //     //return Right(books);
  //     return right(books);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioException(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
}

/*
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_mvvm/model/appointments_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  Future<List<AppointmentsModel>> fetchAppointmentsHTTP() async {
    final response = await http.get(
      Uri.parse('https://geu.ejust.edu.eg/get/appointments/api'),
    );

    if (response.statusCode == 200) {


      List<dynamic> jsonList = json.decode(response.body);



      // List<AppointmentsModel> appointments = jsonList
      //     .map((json) => AppointmentsModel.fromJson(json))
      //     .toList();

      List<AppointmentsModel> appointments = [];

      for (var item in jsonList) {
        appointments.add(AppointmentsModel.fromJson(item));
      }


      return appointments;
    } else {
      throw Exception('Failed to load appointments');
    }
  }

  Future<List<dynamic>> fetchAppointmentsDio() async {
    final response = await Dio().get(
      'https://geu.ejust.edu.eg/get/appointments/api',
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load appointments');
    }
  }
}
 */
