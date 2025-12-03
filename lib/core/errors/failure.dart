import 'dart:io';
import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response?.data,
        );
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connectionTimeout with api server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("sendTimeout with api server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receiveTimeout with api server");
      case DioExceptionType.cancel:
        return ServerFailure("cancel with api server");
      case DioExceptionType.unknown:
        // if (dioException.message?.contains('SocketException') ?? false) {
        //   return ServerFailure(
        //     "SocketException with api server, No internet connection",
        //   );
        // }
        if (dioException.error is SocketException) {
          return ServerFailure("No Internet Connection");
        }
        return ServerFailure("unknown with api server");

      default:
        return ServerFailure("Opps There was an Error, Please try again");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response);
    } else if (statusCode == 404) {
      return ServerFailure("Your Request not found, Please try again");
    } else if (statusCode == 500) {
      return ServerFailure("Internal server error, Please try again");
    } else {
      return ServerFailure("Opps There was an Error, Please try again");
    }
  }
}
