import 'package:domino/shared/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:domino/features/history/domain/order_status.dart';
import 'package:domino/features/history/presentation/widgets/history_card.dart';
import 'package:domino/features/history/presentation/controller/history_controller.dart';
import 'package:domino/shared/widgets/components/empty_state.dart';
import 'package:domino/utils/constants/images/image_strings.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/order_history_text.dart';

class WHistoryListView extends StatelessWidget {
  const WHistoryListView({super.key, required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final orders = HistoryController.instance.ordersForStatus(status);

    // Display no pending order
    if (orders.isEmpty) {
      return WEmptyState(
        image: TImageString.emptyOrder,
        title: OrderHistoryTexts.noOrdersForStatus(status.label),
      );
    }

    return ListView.separated(
      padding: TSpacingStyle.historyPadding,
      itemCount: orders.length,
      separatorBuilder: (_, _) => const SizedBox(height: TSizes.spaceBtwItems),

      itemBuilder: (_, index) {
        final order = orders[index];
        final items = order['items'] as List<Map<String, Object>>;

        return WHistoryCard(
          items: items,
          status: status,
          purchaseDate: order['purchaseDate'] as String,
        );
      },
    );
  }
}
