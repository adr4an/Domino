import 'package:domino/shared/widgets/components/buttons/gradient_btn.dart';
import 'package:domino/shared/widgets/components/custom_shapes/container/rounded_container.dart';
import 'package:domino/shared/widgets/components/fields/wtext_field.dart';
import 'package:domino/features/profile/presentation/controller/edit_field_controller.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/profile_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

Future<String?> showEditFieldSheet({
  required String title,
  String initialValue = '',
  String? hintText,
  TextInputType keyboardType = TextInputType.text,
  List<TextInputFormatter>? inputFormatters,

  /// Same as WtextField.preIcon: a Widget, IconData, or icon asset path.
  Object? preIcon,
  String? Function(String value)? validator,
}) async {
  // Unique tag so multiple sheets never share one controller.
  final tag = UniqueKey().toString();
  final controller = Get.put(
    EditFieldController(initialValue: initialValue, validator: validator),
    tag: tag,
  );

  final route = ModalSheetRoute<String>(
    swipeDismissible: true,
    viewportBuilder: (context, child) {
      return SheetViewport(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: child,
      );
    },
    builder: (_) => EditFieldSheet(
      title: title,
      hintText: hintText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      preIcon: preIcon,
      controller: controller,
    ),
  );

  final result = await Get.key.currentState!.push<String>(route);

  await route.completed;
  Get.delete<EditFieldController>(tag: tag);

  return result;
}

/// Stateless UI: all state lives in EditFieldController.
class EditFieldSheet extends StatelessWidget {
  const EditFieldSheet({
    super.key,
    required this.title,
    required this.controller,
    required this.keyboardType,
    this.hintText,
    this.inputFormatters,
    this.preIcon,
  });

  final String title;
  final String? hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Object? preIcon;
  final EditFieldController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SheetKeyboardDismissible(
      dismissBehavior: SheetKeyboardDismissBehavior.onDrag(),
      child: Sheet(
        decoration: MaterialSheetDecoration(
          // sheet height follows its content
          size: SheetSize.fit,
          color: TColors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(TSizes.md),
          ),
          clipBehavior: Clip.antiAlias,
        ),

        child: Material(
          type: MaterialType.transparency,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _DragHandle(),
                const SizedBox(height: TSizes.spaceBtwItems),

                Text(
                  title,
                  style: theme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: TSizes.spaceBtwItems),

                Obx(
                  () => WtextField(
                    label: hintText ?? '',
                    controller: controller.textController,
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters,
                    preIcon: preIcon,
                    onChanged: (_) => controller.clearError(),
                    onSubmitted: (_) => controller.save(),
                    errorText: controller.error.value,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                SizedBox(
                  width: double.infinity,
                  child: WGradientButton(
                    onPressed: controller.save,
                    textLabel: TProfileStrings.saveChanges,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WRoundedContainer(
        width: 36,
        height: 4,
        radius: 2,
        backgroundColor: TColors.grey300,
      ),
    );
  }
}
