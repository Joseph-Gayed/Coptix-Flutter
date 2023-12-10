class Failure implements Exception {
  int code; // 200, 201, 400, 303..500 and so on
  String message; // error , success

  Failure({this.code = 0, this.message = ""});
}
