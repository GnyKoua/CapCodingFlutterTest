import 'dart:convert';
import 'dart:io';

import 'package:capcoding_test_technique_flutter_2024/utils/api/api_exception.dart';
import 'package:capcoding_test_technique_flutter_2024/utils/api/base_api_client.dart';
import 'package:capcoding_test_technique_flutter_2024/utils/api/http_status_code.dart';
import 'package:http/http.dart' as http;

class ApiClient extends BaseApiClient {
  @override
  Future apiGet(
    String url, {
    Map<String, dynamic> headers = const <String, dynamic>{},
  }) async {
    try {
      final response = await http.get(Uri.parse(url));
      return handleResponse(response);
    } on SocketException {
      throw FetchDataException("Pas de connexion internet !");
    }
  }

  @override
  Future apiPost(
    String url, {
    required body,
    Map<String, dynamic> headers = const <String, dynamic>{},
  }) {
    throw UnimplementedError();
  }

  dynamic handleResponse(http.Response response) {
    switch (response.statusCode) {
      case HttpStatusCode.SUCCESS:
        return jsonDecode(response.body);
      case HttpStatusCode.BADREQUEST: //Bad request
        throw BadRequestException(response.body);
      case HttpStatusCode.UNAUTHORIZED: //Unauthorized
        throw UnAuthorizedException(response.body);
      case HttpStatusCode.NOTFOUND: //Resource Not Found
        throw NotFoundException(response.body);
      case HttpStatusCode.SERVERERROR: //Internal Server Error
        throw InternalServerErrorException(response.body);
      default:
        throw FetchDataException(response.body);
    }
  }
}
