// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResponseModel {
  int statusCode;

  String? errorMessage;
  Map<String, dynamic>? data;
  ResponseModel({
    required this.statusCode,
    this.errorMessage,
    this.data,
  });
  bool get success => statusCode >= 200 && statusCode < 300;
}
