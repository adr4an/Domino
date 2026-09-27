import 'package:domino/features/history/presentation/controller/history_controller.dart';
import 'package:domino/features/history/data/repositories/history_repository_impl.dart';
import 'package:domino/features/history/presentation/widgets/history_tab_selector.dart';
import 'package:domino/shared/widgets/app_bar/app_bar.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/texts/order_history_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:domino/features/history/presentation/widgets/history_list_view.dart.dart';
import 'package:domino/utils/constants/sizes.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      HistoryController(repository: HistoryRepositoryImpl()),
    );

    return Scaffold(
      backgroundColor: TColors.grey200,
      appBar: WAppBar(
        showBackArrow: false,
        title: const Text(OrderHistoryTexts.orderHistory),
        actions: [Icon(Icons.more_vert)],
      ),

      body: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwItems),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
            child: HistoryTabSelector(),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: Obx(
                () => WHistoryListView(
                  status: controller.statuses[controller.selectedIndex.value],
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
