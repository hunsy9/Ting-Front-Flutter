import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ting_flutter/screens/home/model/myProfileModel.dart';

class ProfileController extends GetxController {
  var profileLinks = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    // image = api();
    fetchData();
  }

  void fetchData() {
    var links = ['assets/images/home/filter.png', 'assets/images/home/filter.png', 'assets/images/home/teamchat.png'];
    profileLinks.assignAll(links);
  }
}
