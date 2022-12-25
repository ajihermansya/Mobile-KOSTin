import 'package:get/get.dart';

import '../controllers/home_inti_controller.dart';

class HomeIntiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeIntiController>(
      () => HomeIntiController(),
    );
  }
}
