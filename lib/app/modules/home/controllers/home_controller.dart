import 'package:get/get.dart';
import 'package:kostin/app/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

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