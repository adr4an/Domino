import 'package:domino/features/chat/presentation/controller/support_chat_controller.dart';
import 'package:get/get.dart';

class SupportChatBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => SupportChatController());
}
