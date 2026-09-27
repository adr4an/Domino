import 'package:domino/shared/widgets/components/buttons/gradient_btn.dart';
import 'package:domino/shared/widgets/components/custom_shapes/container/rounded_container.dart';
import 'package:domino/shared/widgets/components/fields/wtext_field.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/texts/chat_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// Add the import for WRoundedContainer here (hover over it, then Ctrl+.)

class ChatRatingCard extends StatelessWidget {
  const ChatRatingCard({
    super.key,
    required this.rating,
    required this.onRatingChanged,
    required this.feedbackController,
    required this.onSubmit,
  });

  final int rating;
  final ValueChanged<int> onRatingChanged;
  final TextEditingController feedbackController;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final ratingLabel = TChatText.ratingLabels[rating];

    return WRoundedContainer(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      padding: const EdgeInsets.all(14),
      showBorder: true,
      borderColor: TColors.borderSecondary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Show the conversation ended message
          Text(
            TChatText.conversationEnded,
            style: text.labelSmall?.copyWith(
              color: TColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),

          const Divider(height: 1, color: TColors.borderSecondary),
          const SizedBox(height: 12),

          Text(
            TChatText.ratingQuestion,
            textAlign: TextAlign.center,
            style: text.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),

          RatingBar.builder(
            initialRating: rating.toDouble(),
            minRating: 1,
            itemCount: 5,
            itemSize: 32,
            glow: false,
            itemPadding: const EdgeInsets.symmetric(horizontal: 3),
            unratedColor: TColors.grey300,
            itemBuilder: (context, _) =>
                const Icon(Icons.star_rounded, color: TColors.secondary),
            onRatingUpdate: (value) => onRatingChanged(value.toInt()),
          ),

          if (ratingLabel != null) ...[
            const SizedBox(height: 8),
            WRoundedContainer(
              radius: 10,
              backgroundColor: TColors.softGrey,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(ratingLabel, style: text.bodySmall),
            ),
          ],
          const SizedBox(height: 10),

          WtextField(
            label: TChatText.feedbackHint,
            controller: feedbackController,
            minLines: 2,
            maxLines: 3,
            fillColor: TColors.softGrey,
            borderColor: TColors.borderSecondary,
            focusedBorderWidth: 1,
          ),
          const SizedBox(height: 10),

          // Replace with your gradient button once I see its constructor
          SizedBox(
            width: double.infinity,
            child: WGradientButton(
              onPressed: onSubmit,
              textLabel: TChatText.submitRating,
            ),
          ),
        ],
      ),
    );
  }
}
