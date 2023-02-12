import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProfileController extends GetxController {
  var profileLinks = <String>[].obs;
  var isReady = <bool>[].obs;
  var nickNames = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    // image = api();
    fetchData();
  }

  void fetchData() {
    var ready = [true, false, false];

    var names = ['Crown0', 'Crown1', 'Crown2'];
    
    var links = [
      'assets/images/home/crown.png',
      'assets/images/home/crown.png',
      'assets/images/home/crown.png'
    ];

    profileLinks.assignAll(links);
    isReady.assignAll(ready);
    nickNames.assignAll(names);
  }
}
