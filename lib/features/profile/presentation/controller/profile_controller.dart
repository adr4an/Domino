import 'package:domino/features/auth/presentation/pages/sign_in.dart';
import 'package:domino/features/chat/presentation/pages/chat_screen.dart';
import 'package:domino/features/profile/presentation/widgets/edit_field_sheet.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/texts/profile_string.dart';
import 'package:domino/shared/widgets/components/fields/wphone_prefix.dart';
import 'package:domino/utils/formatters/phone_input_formatters.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  // inside ProfileController
  final username = 'coding_with_t'.obs;
  final phone = '987654123'.obs;
  final email = 'angelawhite@gmail.com'.obs;

  Future<void> _edit({
    required String title,
    required RxString field,
    String? hint,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    Object? preIcon,
    String? Function(String)? validator,
  }) async {
    final newValue = await showEditFieldSheet(
      title: title,
      initialValue: field.value,
      hintText: hint,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      preIcon: preIcon,
      validator: validator,
    );
    if (newValue != null) field.value = newValue;
  }

  void editUsername() => _edit(
    title: TProfileStrings.username,
    field: username,
    hint: TProfileStrings.enterUsername,
    preIcon: TIconString.user,
    validator: (v) {
      if (v.isEmpty) return TProfileStrings.nameIsRequired;
      if (v.length < 3) return TProfileStrings.usernameTooShort;
      return null;
    },
  );

  void editPhone() => _edit(
    title: TProfileStrings.phoneNumber,
    field: phone,
    hint: TProfileStrings.enterPhone,
    keyboardType: TextInputType.phone,
    preIcon: const WPhonePrefix(),
    inputFormatters: TPhoneInputFormatters.local,
    validator: (v) {
      if (v.isEmpty) return TProfileStrings.phoneIsRequired;
      if (v.length != 10) return TProfileStrings.phoneMustBe10Digits;
      return null;
    },
  );

  void editEmail() => _edit(
    title: TProfileStrings.email,
    field: email,
    hint: TProfileStrings.enterEmail,
    preIcon: TIconString.email,
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (value.isEmpty) return TProfileStrings.emailIsRequired;
      if (!GetUtils.isEmail(value)) return TProfileStrings.validEmailRequired;
      return null;
    },
  );

  void goToAuth() {
    Get.to(() => SignInScreen());
  }

  void goToChatScreen() {
    Get.to(() => SupportChatScreen());
  }
}
