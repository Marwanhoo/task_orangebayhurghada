import 'package:dio/dio.dart';
import 'package:task_orangebayhurghada/core/utils/app_strings.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);

  /// GET Request

  // get request dio
  //Future<Map<String, dynamic>>
   getRequestSimple({required String url}) async {
    var response = await _dio.get(url);
    return response.data;
  }

  // get request with interceptors
  Future<Response> getRequestWithInterceptor({
    required String baseUrl,
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Dio dio = Dio(
      BaseOptions(
        //baseUrl: baseUrl,
        validateStatus: (status) => true,
      ),
    );
    dio.interceptors.add(PrettyDioLogger());

    Response response = await dio.get(
      baseUrl + path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response;
  }

  // get request without interceptors
  Future<Response> getRequestRaw({
    required String baseUrl,
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response =
        await Dio(
          BaseOptions(baseUrl: baseUrl, validateStatus: (status) => true),
        ).get(
          path,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
    return response;
  }

  /// Post Request

  // post request dio interceptors
  Future<Response> postRequestWithInterceptor({
    required String baseUrl,
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    Dio dio = Dio(
      BaseOptions(
        //baseUrl: baseUrl,
        validateStatus: (status) => true,
      ),
    );
    dio.interceptors.add(PrettyDioLogger());

    Response response = await dio.post(
      baseUrl + path,
      queryParameters: queryParameters,
      data: data, // Body form-data
      options: Options(headers: headers),
    );
    return response;
  }

  // post request dio without interceptors
  Future<Response> postRequestRaw(
    String baseUrl,
    String path,
    Map<String, dynamic> queryParameters,
  ) async {
    Response response = await Dio(
      BaseOptions(baseUrl: baseUrl),
    ).post(path, queryParameters: queryParameters);
    return response;
  }
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