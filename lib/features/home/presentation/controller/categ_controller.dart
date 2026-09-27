import 'package:get/get.dart';

class CategController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void selectCategory(int index) {
    selectedIndex.value = index;
  }
}
