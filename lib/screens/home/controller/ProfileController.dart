import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProfileController extends GetxController {
  var profileLinks = <String>[].obs;
  var isReady = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    // image = api();
    fetchData();
  }

  void fetchData() {
    var links = [
      'assets/images/home/filter.png',
      'assets/images/home/filter.png',
      'assets/images/home/teamchat.png'
    ];

    var ready = [true, false, false];
    profileLinks.assignAll(links);
    isReady.assignAll(ready);
  }
}
