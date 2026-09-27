import 'package:domino/features/chat/presentation/controller/support_chat_controller.dart';
import 'package:domino/features/chat/presentation/widgets/chat_message_wrapper.dart';
import 'package:domino/features/chat/presentation/widgets/components/chat_composer.dart';
import 'package:domino/features/chat/presentation/widgets/components/chat_rating_card.dart';
import 'package:domino/features/chat/presentation/widgets/components/chat_text_bubble.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ChatConversation extends StatelessWidget {
  const ChatConversation({
    super.key,
    required this.controller,
    required this.composer,
  });

  final SupportChatController controller;
  final ChatComposer composer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Chat(
            chatController: controller.chat,
            currentUserId: SupportChatController.myId,
            resolveUser: controller.resolveUser,
            backgroundColor: TColors.light,
            builders: Builders(
              // our own composer lives below, so hide the default one
              composerBuilder: (_) => const SizedBox.shrink(),
              chatMessageBuilder:
                  (
                    context,
                    message,
                    index,
                    animation,
                    child, {
                    bool? isRemoved,
                    required bool isSentByMe,
                    MessageGroupStatus? groupStatus,
                  }) => ChatMessageWrapper(
                    message: message,
                    index: index,
                    animation: animation,
                    isSentByMe: isSentByMe,
                    child: child,
                  ),

              textMessageBuilder:
                  (
                    context,
                    message,
                    index, {
                    required bool isSentByMe,
                    MessageGroupStatus? groupStatus,
                  }) => ChatTextBubble(message: message, index: index),
            ),
          ),
        ),

        Obx(() {
          final ended = controller.chatEnded.value;
          final rating = controller.rating.value;

          // Show the rating card instead of the composer
          if (ended) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.6,
              ),
              child: SingleChildScrollView(
                child: ChatRatingCard(
                  rating: rating,
                  onRatingChanged: controller.setRating,
                  feedbackController: controller.feedbackController,
                  onSubmit: controller.submitRating,
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: composer,
          );
        }),
      ],
    );
  }
}
