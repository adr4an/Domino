import 'package:domino/shared/widgets/components/fields/wtext_field.dart';
import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/texts/chat_text.dart';
import 'package:flutter/material.dart';

// Let your IDE add the import for WtextField (Ctrl+.) since I don't know its path.

class ChatComposer extends StatelessWidget {
  const ChatComposer({
    super.key,
    this.controller,
    this.onChanged,
    this.onSend,
    this.onAttach,
    this.canSend = true,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSend;
  final VoidCallback? onAttach;
  final bool canSend;

  @override
  Widget build(BuildContext context) {
    return WtextField(
      label: TChatText.composerHint,
      controller: controller,
      onChanged: onChanged,
      hintColor: TColors.darkGrey,
      textColor: TColors.textPrimary,
      borderColor: TColors.borderSecondary,
      focusedBorderWidth: 1,
      minLines: 1,
      maxLines: 4,
      preIcon: WDisplayIcon(
        iconPath: TIconString.image,
        color: canSend ? TColors.primary : TColors.darkGrey,
      ),
      onPreIconPressed: onAttach,
      postIcon: WDisplayIcon(
        iconPath: TIconString.send,
        color: canSend ? TColors.primary : TColors.darkGrey,
      ),
      onPostIconPressed: canSend ? onSend : null,
    );
  }
}
