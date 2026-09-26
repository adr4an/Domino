import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:domino/features/history/domain/order_status.dart';

class HistoryController extends GetxController {
  static HistoryController get instance => Get.find();

  final selectedIndex = 0.obs;
  final pageController = PageController();

  // collect all the values of enums
  final statuses = OrderStatus.values;

  @override
  void onReady() {
    super.onReady();
    syncPageToSelectedIndex();
  }

  Future<void> changeTab(int index) async {
    // Pressed the same tab, stop immediately.
    if (selectedIndex.value == index) return;

    selectedIndex.value = index;

    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    }
  }

  // Updates the currently selected tab index.
  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  void syncPageToSelectedIndex() {
    if (!pageController.hasClients) return;

    final currentPage = pageController.page?.round();
    if (currentPage != selectedIndex.value) {
      pageController.jumpToPage(selectedIndex.value);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
