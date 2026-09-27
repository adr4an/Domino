import 'package:domino/features/chat/presentation/controller/support_chat_controller.dart';
import 'package:domino/features/chat/presentation/widgets/components/chat_options_menu.dart';
import 'package:domino/shared/widgets/app_bar/app_bar.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/texts/chat_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key, required this.controller});

  final SupportChatController controller;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  List<ChatMenuItem> _menuItems() => [
    ChatMenuItem(
      label: TChatText.endConversation,
      icon: TIconString.leave,
      onTap: controller.confirmEndChat,
    ),
    ChatMenuItem(
      label: TChatText.helpTopics,
      icon: TIconString.help,
      onTap: controller.confirmEndChat,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WAppBar(
      title: const Text(TChatText.customerSupport),
      actions: [
        Obx(() {
          final hasMessages = controller.hasMessages.value;
          final ended = controller.chatEnded.value;

          if (!hasMessages || ended) return const SizedBox.shrink();

          return ChatOptionsMenu(
            menuController: controller.menuController,
            items: _menuItems(),
          );
        }),
      ],
    );
  }
}
