import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/texts/chat_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as ui;

class ChatMessageWrapper extends StatelessWidget {
  const ChatMessageWrapper({
    super.key,
    required this.message,
    required this.index,
    required this.animation,
    required this.child,
    required this.isSentByMe,
  });

  final Message message;
  final int index;
  final Animation<double> animation;
  final Widget child;
  final bool isSentByMe;

  @override
  Widget build(BuildContext context) {
    if (isSentByMe) {
      return ui.ChatMessage(
        message: message,
        index: index,
        animation: animation,
        child: child,
      );
    }

    return ui.ChatMessage(
      message: message,
      index: index,
      animation: animation,
      topWidget: Padding(
        padding: const EdgeInsets.only(left: 44, bottom: 6),
        child: Text(
          TChatText.staffAssistance,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: TColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      leadingWidget: const Padding(
        padding: EdgeInsets.only(right: 8),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: TColors.darkGrey,
          child: WDisplayIcon(iconPath: TIconString.staff),
        ),
      ),
      child: child,
    );
  }
}
