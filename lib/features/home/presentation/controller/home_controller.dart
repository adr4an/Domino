import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;
  final searchController = TextEditingController();
  final hasSearchText = false.obs;

  void updateSearchText(String value) {
    hasSearchText.value = value.trim().isNotEmpty;
  }

  void updatePageIndicator(int index) {
    carouselCurrentIndex.value = index;
  }

  void goToStore() {
    // Get.to(() => StoreScreen());
  }

  void goToProductDetails() {
    //  Get.to(() => ProductDetailsScreen());
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
