import 'package:get/get.dart';

class LoginpageController extends GetxController {
  //TODO: Implement LoginpageController

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
// final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   void onPressedButtonLogin() async {
//     String email = emailController.text;
//     String password = passwordController.text;
//     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
//       AwesomeDialog(
//               context: Get.context!,
//               dialogType: DialogType.error,
//               title: "Opss...",
//               desc: "Terjadi Kesalahan, user dan password tidak benar")
//           .show();
//       return;
//     }
//     // ProgressDialog progressDialog = ProgressDialog(context);
//     // progressDialog.style(message: "loading..");
//     // progressDialog.show();
//     final response = await http
//         .post(Uri.parse('http://localhost/kostin/public/api/login'), body: {
//       'email': emailController.text,
//       'password': passwordController.text
//     }, headers: {
//       'Accept': 'application/json'
//     });
//     //progressDialog.hide();
//     if (response.statusCode == 200) {
//       SpUtil.putBool("isLogin", true);
//       SpUtil.putString("email", emailController.text);
//       Get.offAndToNamed(Routes.HOME);
//     } else {
//       AwesomeDialog(
//               context: Get.context!,
//               dialogType: DialogType.error,
//               title: "Informasi Aku Salah",
//               desc: "Cek kembali akun anda, atau Lupa passoword!")
//           .show();
//       return;
//     }
//   }