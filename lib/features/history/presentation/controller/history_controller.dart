import 'package:get/get.dart';
import 'package:domino/features/history/domain/order_status.dart';
import 'package:domino/features/history/domain/repositories/history_repository.dart';

class HistoryController extends GetxController {
  HistoryController({required this.repository});

  static HistoryController get instance => Get.find();

  final HistoryRepository repository;
  final selectedIndex = 0.obs;

  // collect all the values of enums
  final statuses = OrderStatus.values;

  List<Map<String, Object>> ordersForStatus(OrderStatus status) {
    return repository.ordersForStatus(status);
  }

  // Updates the currently selected tab index.
  void changeTab(int index) => selectedIndex.value = index;
}
