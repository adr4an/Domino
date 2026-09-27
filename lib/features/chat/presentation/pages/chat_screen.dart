import 'package:domino/features/chat/presentation/controller/support_chat_controller.dart';
import 'package:domino/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:domino/features/chat/presentation/widgets/chat_convo.dart';
import 'package:domino/features/chat/presentation/widgets/components/chat_composer.dart';
import 'package:domino/features/chat/presentation/widgets/chat_empty_state.dart';
import 'package:domino/features/chat/presentation/widgets/suggestion_chips.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportChatScreen extends StatelessWidget {
  const SupportChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SupportChatController>();

    return Scaffold(
      backgroundColor: TColors.light,
      appBar: ChatAppBar(controller: controller),

      body: SafeArea(
        child: Obx(() {
          // Listen to the controller's state
          final empty = !controller.hasMessages.value;
          final canSend = controller.hasText.value;

          // Build the composer with the current state of the controller
          final composer = ChatComposer(
            controller: controller.textController,
            onChanged: controller.onTextChanged,
            canSend: canSend,
            onSend: () =>
                controller.sendMessage(controller.textController.text),
            onAttach: () => debugPrint('Attach tapped'),
          );

          // No messages yet: welcome view with chips
          if (empty) {
            return ChatEmptyState(
              composer: composer,
              chips: ChatSuggestionChips(
                onSelected: controller.onSuggestionSelected,
              ),
            );
          }

          //  Show the chat conversation
          return ChatConversation(controller: controller, composer: composer);
        }),
      ),
    );
  }
}
