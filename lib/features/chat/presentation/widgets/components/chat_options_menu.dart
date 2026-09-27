// lib/features/chat/presentation/widgets/chat_options_menu.dart
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatOptionsMenu extends StatelessWidget {
  const ChatOptionsMenu({
    super.key,
    required this.menuController,
    required this.items,
  });

  final CustomPopupMenuController menuController;
  final List<ChatMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      controller: menuController,
      pressType: PressType.singleClick,
      showArrow: true,
      arrowColor: TColors.white,
      arrowSize: 16,
      barrierColor: Colors.transparent,
      horizontalMargin: 12,
      verticalMargin: 0,
      menuBuilder: () => Material(
        color: TColors.white,
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: 210,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < items.length; i++) ...[
                if (i > 0)
                  const Divider(height: 1, color: TColors.borderSecondary),
                InkWell(
                  onTap: () {
                    menuController.hideMenu();
                    items[i].onTap();
                  },
                  child: items[i],
                ),
              ],
            ],
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Icon(Icons.more_vert),
      ),
    );
  }
}

class ChatMenuItem extends StatelessWidget {
  const ChatMenuItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label.toUpperCase(),
            style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          WDisplayIcon(iconPath: icon),
        ],
      ),
    );
  }
}
