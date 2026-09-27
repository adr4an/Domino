import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditFieldController extends GetxController {
  EditFieldController({required String initialValue, this.validator})
    : textController = TextEditingController(text: initialValue);

  final TextEditingController textController;
  final String? Function(String value)? validator;
  final error = RxnString();

  void clearError() {
    if (error.value != null) error.value = null;
  }

  void save() {
    final value = textController.text.trim();
    final message = validator?.call(value);
    if (message != null) {
      error.value = message;
      return;
    }
    Get.back(result: value);
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
