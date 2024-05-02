import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nsb_remit/utils/constants/error_message.dart';

import '../exceptions/app_error.dart';

enum RequestType {
  get,
  post,
  put,
  patch,
  delete;

  String get value {
    switch (this) {
      case RequestType.get:
        return 'GET';

      case RequestType.post:
        return 'POST';

      case RequestType.put:
        return 'PUT';

      case RequestType.patch:
        return 'PATCH';

      case RequestType.delete:
        return 'DELETE';
    }
  }
}

class ApiService {
  ApiService._();

  static Future<Map<String, dynamic>> callApi(
    String endpoint,
    RequestType requestType, {
    Map<String, dynamic>? requestBody,
    Map<String, String>? headers,
    required Map<int, String> errorMessages,
    Map<int, String>? successMessages,
  }) async {
    if (requestType == RequestType.get && requestBody != null) {
      throw Exception(ErrorMessages.invalidRequestParametersMessage);
    }

    final url = "https://dev-ceylonremit.paymediasolutions.com:5004/api/mobile$endpoint";

    late http.Response response;

    try {
      response = await callApiForRequestType(
        url,
        requestType,
        requestBody,
        headers,
      );

      print('>>>> ENDPOINT <<<<');
      print(url);
      print('>>>> HEADERS <<<<');
      print(headers);
      print('>>>> BODY <<<<');
      log(requestBody.toString());
      print('>>>> STATUS_CODE <<<<');
      print(response.statusCode);
      print('>>>> RESPONSE <<<<');
      log(response.body);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final data = responseBody['data'];
        if (data['status'] != null && successMessages != null) {
          switch (data['status']) {
            case 0x8000:
              data['message'] = successMessages[0x8000];
              break;
            case 0x8010:
              data['message'] = successMessages[0x8010];
              break;
            case 0x8020:
              data['message'] = successMessages[0x8020];
              break;
            case 0x8030:
              data['message'] = successMessages[0x8030];
              break;
            case 0x8040:
              data['message'] = successMessages[0x8040];
              break;
            case 0x8050:
              data['message'] = successMessages[0x8050];
              break;
            case 0x8060:
              data['message'] = successMessages[0x8060];
              break;
            case 0x8070:
              data['message'] = successMessages[0x8070];
              break;
            case 0x8080:
              data['message'] = successMessages[0x8080];
              break;
            default:
              data['message'] = "";
              break;
          }
        }
        return data;
      } else if (response.statusCode == 400) {
        throw AppError(ErrorMessages.genericMessage);
      } else if (response.statusCode == 401) {
        throw AppError(ErrorMessages.unauthorizedMessage);
      } else if (response.statusCode >= 402 && response.statusCode <= 422) {
        final responseBody = jsonDecode(response.body);
        final code = responseBody['data']['code'];

        String message = responseBody['data']['message'] ?? '';

        if (code != null) {
          switch (code) {
            case 0x9001:
              message = errorMessages[0x9001] ?? ErrorMessages.genericMessage;
              break;
            case 0x9002:
              message = errorMessages[0x9002] ?? ErrorMessages.genericMessage;
              break;
            case 0x9003:
              message = errorMessages[0x9003] ?? ErrorMessages.genericMessage;
              break;

            default:
              message = ErrorMessages.genericMessage;
          }
        }
        throw AppError(message);
      } else if (response.statusCode >= 423 && response.statusCode <= 500) {
        final responseBody = jsonDecode(response.body);
        final code = responseBody['data']['code'];

        String message = responseBody['data']['message'] ?? '';

        if (code != null) {
          switch (code) {
            case 0x9001:
              message = errorMessages[0x9001] ?? ErrorMessages.genericMessage;
              break;
            case 0x9002:
              message = errorMessages[0x9002] ?? ErrorMessages.genericMessage;
              break;
            case 0x9003:
              message = errorMessages[0x9003] ?? ErrorMessages.genericMessage;
              break;

            default:
              message = ErrorMessages.genericMessage;
          }
        }
        throw AppError(message);
      }
    } on SocketException {
      throw AppError(ErrorMessages.noInternetMessage);
    }

    throw AppError(ErrorMessages.genericMessage);
  }

  static Future<http.Response> callApiForRequestType(
    String url,
    RequestType requestType,
    Map<String, dynamic>? requestBody,
    Map<String, String>? headers,
  ) {
    final requestUrl = Uri.parse(url);

    requestBody ??= {};

    final encodedRequestBody = jsonEncode(requestBody);

    final commonHeaders = {
      'Content-Type': 'application/json',
      ...?headers,
    };

    switch (requestType) {
      case RequestType.get:
        return http.get(requestUrl);

      case RequestType.post:
        return http.post(requestUrl,
            body: encodedRequestBody, headers: commonHeaders);

      case RequestType.put:
        return http.put(requestUrl,
            body: encodedRequestBody, headers: commonHeaders);

      case RequestType.patch:
        return http.patch(requestUrl,
            body: encodedRequestBody, headers: commonHeaders);

      case RequestType.delete:
        return http.delete(requestUrl,
            body: encodedRequestBody, headers: commonHeaders);
    }
  }
}
