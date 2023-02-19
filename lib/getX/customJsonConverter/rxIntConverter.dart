import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

class RxIntConverter implements JsonConverter<RxInt?, int?> {
  const RxIntConverter();

  @override
  RxInt? fromJson(int? json) {
    return json != null ? RxInt(json) : null;
  }

  @override
  int? toJson(RxInt? object) {
    return object?.value;
  }
}