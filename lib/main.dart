import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kostin/app/modules/IntroductionScreen/views/introduction_screen_view.dart';
import 'package:kostin/app/modules/Listone/views/listone_view.dart';
import 'package:kostin/app/modules/NavigationBarr/views/navigation_barr_view.dart';
import 'package:kostin/app/modules/home/views/home_view.dart';
import 'package:kostin/app/modules/home_inti/views/home_inti_view.dart';
import 'package:kostin/app/modules/identitas/views/identitas_view.dart';
import 'package:kostin/provider/cart_provider.dart';
import 'package:kostin/widget/component_home_one/listview_api.dart';
import 'package:kostin/widget/home_one.dart';
import 'package:kostin/widget/splash.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //Digunakan untuk handphone layar full
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    // );

//RETRUN SEDIKIT

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => CartProvider()))
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            backgroundColor: Color(0xFFF5F6F6),
            primaryColor: Color(0xFF811B83),
            accentColor: Color(0xFFFA5019),
            textTheme: TextTheme(
              headline1: TextStyle(
                color: Color(0xFF100E34),
              ),
              bodyText1: TextStyle(color: Color(0xFF100E34).withOpacity(0.5)),
            )),
        home: HomeIntiView(),
      ),
    );

    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: ((context) => CartProvider()))
            ],
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  backgroundColor: Color(0xFFF5F6F6),
                  primaryColor: Color(0xFF811B83),
                  accentColor: Color(0xFFFA5019),
                  textTheme: TextTheme(
                    headline1: TextStyle(
                      color: Color(0xFF100E34),
                    ),
                    bodyText1:
                        TextStyle(color: Color(0xFF100E34).withOpacity(0.5)),
                  )),
              title: "KOSTin",
              initialRoute: Routes.INTRODUCTION_SCREEN,
              getPages: AppPages.routes,
            ),
          );
        }
      },
    );
  }
}
