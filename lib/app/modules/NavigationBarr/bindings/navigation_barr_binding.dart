import 'package:get/get.dart';

import '../controllers/navigation_barr_controller.dart';

class NavigationBarrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationBarrController>(
      () => NavigationBarrController(),
    );
  }
}
