import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

class RxStringConverter implements JsonConverter<RxString?, String?> {
  const RxStringConverter();

  @override
  RxString? fromJson(String? json) {
    return json != null ? RxString(json) : null;
  }

  @override
  String? toJson(RxString? object) {
    return object?.value;
  }
}