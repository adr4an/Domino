import 'package:domino/shared/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:domino/features/history/domain/order_status.dart';
import 'package:domino/features/history/presentation/widgets/history_card.dart';
import 'package:domino/features/history/presentation/widgets/history_empty_state.dart';
import 'package:domino/utils/constants/reference.dart';
import 'package:domino/utils/constants/images/image_strings.dart';
import 'package:domino/utils/constants/sizes.dart';

class WHistoryListView extends StatelessWidget {
  const WHistoryListView({super.key, required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final orders = status == OrderStatus.pending
        ? TReference.pendingOrders
        : <Map<String, Object>>[];

    // Display no pending order
    if (orders.isEmpty) {
      return WHistoryEmptyState(
        image: TImageString.emptyOrder,
        statusLabel: status.label,
      );
    }

    return ListView.separated(
      padding: TSpacingStyle.historyPadding,
      itemCount: orders.length,
      separatorBuilder: (_, _) => const SizedBox(height: TSizes.spaceBtwItems),

      itemBuilder: (_, index) {
        final items = orders[index]['items'] as List<Map<String, Object>>;

        return WHistoryCard(items: items, status: status);
      },
    );
  }
}
