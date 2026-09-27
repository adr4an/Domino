import 'package:domino/features/history/domain/order_status.dart';
import 'package:domino/features/history/presentation/controller/history_controller.dart';
import 'package:domino/shared/widgets/components/tabs/segmented_tab_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryTabSelector extends StatelessWidget {
  const HistoryTabSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HistoryController.instance;

    return Obx(
      () => WSegmentedTabSelector(
        selectedIndex: controller.selectedIndex.value,
        onTabSelected: controller.changeTab,
        labels: controller.statuses.map((status) => status.label).toList(),
      ),
    );
  }
}
