// ignore_for_file: unused_import

import 'dart:convert';

import '../../shared/utils/object_print.dart';

class BaseApiResponse {
  final String message;
  final dynamic body;
  final Map<String, dynamic>? pagination;

  BaseApiResponse({
    required this.message,
    required this.body,
    required this.pagination,
  });

  factory BaseApiResponse.fromJson(dynamic json) {
    Map<String, dynamic> jsonAsMap = json as Map<String, dynamic>;

    String jsonMessage =
        jsonAsMap.containsKey("message") ? json['message'] : "";
    Map<String, dynamic>? jsonPagination =
        jsonAsMap.containsKey("pagination") ? json['pagination'] : {};
    dynamic jsonBody = jsonAsMap.containsKey("body") ? json['body'] : null;

    return BaseApiResponse(
        message: jsonMessage, body: jsonBody, pagination: jsonPagination);
  }

  Map<String, dynamic> toJson() =>
      {"body": body, "message": message, "pagination": pagination};
  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
