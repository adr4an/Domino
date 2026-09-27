import 'package:domino/shared/widgets/images/circular_image.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WUserProfileTile extends StatelessWidget {
  const WUserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const WCircularImage(
        imagePath: TIconString.userProfile,
        width: 50,
        height: 50,
      ),
      title: Text(
        'Coding with T',
        style: Theme.of(
          context,
        ).textTheme.bodyLarge!.apply(color: TColors.white),
      ),
      subtitle: Text(
        'angelawhite@gmail.com',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () {},
        icon: const Icon(Iconsax.edit, color: TColors.white),
      ),
    );
  }
}
