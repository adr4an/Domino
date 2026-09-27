import 'package:domino/features/history/domain/order_status.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WHistoryStatusChip extends StatelessWidget {
  const WHistoryStatusChip({super.key, required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final statusColor = status.color;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.sm + 2,
        vertical: TSizes.xs + 1,
      ),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(TSizes.borderCircular),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Status Dot
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),

          // Status Label
          Text(
            status.label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: statusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
