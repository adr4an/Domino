import 'package:domino/features/history/domain/order_status.dart';
import 'package:domino/features/history/presentation/controller/history_controller.dart';
import 'package:domino/features/history/presentation/widgets/history_tab_button.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryTabSelector extends StatelessWidget {
  const HistoryTabSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HistoryController.instance;

    return Obx(
      () => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: TColors.grey100,
          border: Border.all(color: Colors.white.withValues(alpha: 1)),
          borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
        ),

        child: Row(
          children: List.generate(controller.statuses.length, (index) {
            final status = controller.statuses[index];
            final isSelected = controller.selectedIndex.value == index;

            return HistoryTabButton(
              label: status.label,
              isSelected: isSelected,
              color: status.color,
              onTap: () => controller.changeTab(index),
            );
          }),
        ),
      ),
    );
  }
}
