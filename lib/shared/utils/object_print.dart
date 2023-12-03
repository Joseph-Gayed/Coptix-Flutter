import 'dart:convert';

String objectToPrintableString(Object object) {
  // Encode your object and then decode your object to Map variable
  Map jsonMapped = json.decode(json.encode(object));

  // Using JsonEncoder for spacing
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');

  // encode it to string
  String prettyPrint = encoder.convert(jsonMapped);
  return "\n$prettyPrint";
}
