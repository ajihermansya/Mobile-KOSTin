import 'package:get/get.dart';

class HomeIntiController extends GetxController {
  //TODO: Implement HomeIntiController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

// var email = "".obs;

//   @override
//   void onReady() {
//     bool isLogin = SpUtil.getBool("isLogin") ?? false;
//     if (!isLogin) {
//       Get.offAllNamed(Routes.LOGINPAGE);
//     }
//     email.value = SpUtil.getString('email').toString();
//     super.onReady();
//   }