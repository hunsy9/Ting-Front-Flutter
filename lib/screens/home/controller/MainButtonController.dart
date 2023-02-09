import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class MainButtonController extends GetxController {
  RxString state = ''.obs;
  RxBool bounce = false.obs;

  @override
  void onInit() {
    super.onInit();
    // image = api();
    fetchData();
  }

  void fetchData() {
    state = '매칭 시작'.obs;
  }
}
