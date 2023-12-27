// ignore_for_file: unused_import

import 'dart:convert';

import 'package:coptix/core/network/pagination.dart';

import '../../shared/utils/object_print.dart';

class BaseApiResponse {
  final String message;
  final dynamic body;
  final Pagination? pagination;

  BaseApiResponse({
    required this.message,
    required this.body,
    required this.pagination,
  });

  factory BaseApiResponse.fromJson(dynamic json) {
    Map<String, dynamic> jsonAsMap = json as Map<String, dynamic>;

    String jsonMessage =
        jsonAsMap.containsKey("message") ? json['message'] : "";

    Pagination? jsonPagination;
    if (jsonAsMap.containsKey("pagination") && json['pagination'] != null) {
      jsonPagination = Pagination.fromJson(json['pagination']);
    }

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
