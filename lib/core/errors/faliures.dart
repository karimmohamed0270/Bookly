import 'dart:io';

import 'package:dio/dio.dart';

abstract class Faliures {
  final String errormessage;

  const Faliures(this.errormessage);
}

class ServerFaliures extends Faliures {
  ServerFaliures(super.errormessage);

  factory ServerFaliures.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliures('Connection Timeout with the server');
      case DioExceptionType.sendTimeout:
        return ServerFaliures('Send Timeout with the server');
      case DioExceptionType.receiveTimeout:
        return ServerFaliures('Receive Timeout with the server');
      case DioExceptionType.badResponse:
        // the status code is not 200 or 201
        return ServerFaliures.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFaliures('Request to the server was cancelled');
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return ServerFaliures('No Internet Connection');
        }
        return ServerFaliures('Unexpected error occurred, Please try again!');

      default:
        return ServerFaliures('Something went wrong, Please try again!');
    }
  }

  // that for the status code that is not 200 or 201 but the error is not from dio package
  factory ServerFaliures.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliures('Bad request, Unauthorized, or Forbidden');
    } else if (statusCode == 404) {
      return ServerFaliures('The requested resource was not found');
    } else if (statusCode == 500) {
      return ServerFaliures('Internal Server Error');
    } else {
      return ServerFaliures('Received invalid status code: $statusCode');
    }
  }
}
