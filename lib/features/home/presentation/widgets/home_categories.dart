import 'package:domino/features/home/presentation/controller/categ_controller.dart';
import 'package:domino/features/home/presentation/widgets/categ_card.dart';
import 'package:domino/shared/widgets/layouts/hori_list_view.dart';
import 'package:domino/utils/constants/reference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WHomeCategories extends StatelessWidget {
  const WHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategController());

    return WHoriListView(
      height: 75,
      itemCount: TReference.categoryItems.length,
      itemBuilder: (context, index) {
        final category = TReference.categoryItems[index];

        return Obx(
          () => CategoryCard(
            label: category['label']!,
            imageAsset: category['image']!,
            isSelected: controller.selectedIndex.value == index,
            onTap: () => controller.selectCategory(index),
          ),
        );
      },
    );
  }
}
