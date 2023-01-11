import 'package:get/get.dart';

import 'package:kostin/app/modules/IntroductionScreen/bindings/introduction_screen_binding.dart';
import 'package:kostin/app/modules/IntroductionScreen/views/introduction_screen_view.dart';
import 'package:kostin/app/modules/Listone/bindings/listone_binding.dart';
import 'package:kostin/app/modules/Listone/views/listone_view.dart';
import 'package:kostin/app/modules/NavigationBarr/bindings/navigation_barr_binding.dart';
import 'package:kostin/app/modules/NavigationBarr/views/navigation_barr_view.dart';
import 'package:kostin/app/modules/SignUpScreen/bindings/sign_up_screen_binding.dart';
import 'package:kostin/app/modules/SignUpScreen/views/sign_up_screen_view.dart';
import 'package:kostin/app/modules/home/bindings/home_binding.dart';
import 'package:kostin/app/modules/home/views/home_view.dart';
import 'package:kostin/app/modules/home_inti/bindings/home_inti_binding.dart';
import 'package:kostin/app/modules/home_inti/views/home_inti_view.dart';
import 'package:kostin/app/modules/identitas/bindings/identitas_binding.dart';
import 'package:kostin/app/modules/identitas/views/identitas_view.dart';
import 'package:kostin/app/modules/loginpage/bindings/loginpage_binding.dart';
import 'package:kostin/app/modules/loginpage/views/loginpage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION_SCREEN,
      page: () => IntroductionScreenView(),
      binding: IntroductionScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGINPAGE,
      page: () => LoginpageView(),
      binding: LoginpageBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_SCREEN,
      page: () => SignUpScreenView(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME_INTI,
      page: () => HomeIntiView(),
      binding: HomeIntiBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION_BARR,
      page: () => NavigationBarrView(),
      binding: NavigationBarrBinding(),
    ),
    GetPage(
      name: _Paths.IDENTITAS,
      page: () => IdentitasView(),
      binding: IdentitasBinding(),
    ),
    GetPage(
      name: _Paths.LISTONE,
      page: () => ListoneView(),
      binding: ListoneBinding(),
    ),
  ];
}
