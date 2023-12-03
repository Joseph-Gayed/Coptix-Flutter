// ignore_for_file: unused_import

import 'dart:convert';

import '../../shared/utils/object_print.dart';

class BaseApiResponse {
  final List<String> message;
  final dynamic body;
  final Map<String, dynamic>? pagination;

  BaseApiResponse({
    required this.message,
    required this.body,
    required this.pagination,
  });

  factory BaseApiResponse.fromJson(dynamic json) {
    return BaseApiResponse(
        message: List<String>.from(json['message']),
        body: json['body'],
        pagination: json['pagination']);
  }

  Map<String, dynamic> toJson() =>
      {"body": body, "message": message, "pagination": pagination};
  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
