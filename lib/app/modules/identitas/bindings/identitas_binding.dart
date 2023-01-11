import 'package:get/get.dart';

import '../controllers/identitas_controller.dart';

class IdentitasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IdentitasController>(
      () => IdentitasController(),
    );
  }
}
