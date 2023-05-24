import 'dart:io';

import 'package:dio/dio.dart';

abstract class DioErrorHandler {
  static String handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return 'Connection timeout';
      case DioErrorType.sendTimeout:
        return 'Send timeout';
      case DioErrorType.receiveTimeout:
        return 'Receive timeout';
      case DioErrorType.badCertificate:
        return 'Bad Sertificates';
      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            return 'Произошла ошибка';
          case 401:
            return 'UnAuthorized (mb token expired)';
          case 403:
            return 'Нет доступа для выполнения данной операции';
          case 404:
            return 'Неверный логин/пароль';
        }
        return 'Bad response';
      case DioErrorType.cancel:
        return 'Request cancelled';
      case DioErrorType.connectionError:
        return 'Connection error';
      case DioErrorType.unknown:
        if (error.error is SocketException) {
          return 'No Internet connection';
        }
        return 'Unknown';
    }
  }
}
