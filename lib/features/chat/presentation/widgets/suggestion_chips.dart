import 'package:domino/features/chat/data/datasources/support_faq.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatSuggestionChips extends StatelessWidget {
  const ChatSuggestionChips({super.key, this.onSelected});

  final ValueChanged<String>? onSelected;

  @override
  Widget build(BuildContext context) {
    final suggestions = SupportFaq.questions;

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final text in suggestions)
          _SuggestionChip(text: text, onTap: () => onSelected?.call(text)),
      ],
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  const _SuggestionChip({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: TColors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: TColors.borderPrimary),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: TColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
