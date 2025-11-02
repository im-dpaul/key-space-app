import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:key_space_app/constants/app_strings.dart';
import 'package:key_space_app/core/routes/app_routes.dart';
import 'package:key_space_app/core/routes/routes_names.dart';
import 'package:key_space_app/core/network/error_response.dart';
import 'package:key_space_app/utils/exception_handler/api_exception.dart';

class APIExceptionHandler {
  APIExceptionHandler._privateConstructor();

  static APIException handleError(Exception error) {
    if (error is DioException) {
      var errorObj = ErrorResponse.fromJson(error.response?.data);
      switch (error.type) {
        case DioExceptionType.sendTimeout:
          return APIException(message: ErrorMessages.noInternet);
        case DioExceptionType.connectionTimeout:
          return APIException(message: ErrorMessages.connectionTimeout);
        case DioExceptionType.unknown:
          return APIException(
            message: errorObj.message,
            errors: errorObj.errors,
            code: errorObj.code,
            success: errorObj.success,
          );
        case DioExceptionType.badResponse:
          {
            if (errorObj.code == 401) {
              appRouter.goNamed(
                RoutesNames.home,
                extra: {"message": "Session expired!!!"},
              );
              return APIException(message: errorObj.message);
            } else {
              return APIException(
                message: errorObj.message,
                errors: errorObj.errors,
                code: errorObj.code,
                success: errorObj.success,
              );
            }
          }

        default:
          return APIException(message: ErrorMessages.networkGeneral);
      }
    } else {
      return APIException(message: ErrorMessages.networkGeneral);
    }
  }
}

class HandleError {
  HandleError._privateConstructor();

  static handleError(APIException? error) {
    if (error?.code == 401) {
      //session expired
    } else {
      SnackBar(content: Text(error?.message ?? ErrorMessages.networkGeneral));
    }
  }
}
