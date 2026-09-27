import 'package:domino/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:domino/features/notification/presentation/controller/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(
    () => NotificationController(repository: NotificationRepositoryImpl()),
  );
}
