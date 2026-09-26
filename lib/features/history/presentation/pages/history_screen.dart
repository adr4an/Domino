import 'package:domino/features/history/presentation/controller/history_controller.dart';
import 'package:domino/features/history/presentation/widgets/history_tab_selector.dart';
import 'package:domino/shared/widgets/app_bar/app_bar.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:domino/features/history/domain/order_status.dart';
import 'package:domino/features/history/presentation/widgets/history_list_view.dart.dart';
import 'package:domino/utils/constants/sizes.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryController());

    // Sync the retained tab index after the rebuilt PageView attaches.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.syncPageToSelectedIndex();
    });

    return Scaffold(
      backgroundColor: TColors.grey200,
      appBar: WAppBar(
        showBackArrow: false,
        title: 'Order History',
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
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: OrderStatus.values
                    .map((status) => WHistoryListView(status: status))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
