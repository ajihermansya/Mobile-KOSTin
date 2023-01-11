import 'package:get/get.dart';

import '../controllers/listone_controller.dart';

class ListoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListoneController>(
      () => ListoneController(),
    );
  }
}
