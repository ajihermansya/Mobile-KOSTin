import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:kostin/app/routes/app_pages.dart';
import 'package:kostin/components/page_pop_view.dart';
import 'package:kostin/widget/componen_login_register/common_button.dart';
import 'package:kostin/widget/componen_login_register/localfiles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/introduction_screen_controller.dart';

class IntroductionScreenView extends StatefulWidget {
  @override
  _IntroductionScreenViewState createState() => _IntroductionScreenViewState();
}

class _IntroductionScreenViewState extends State<IntroductionScreenView> {
  var pageController = PageController(initialPage: 0);
  List<PageViewData> pageViewModelData = [];

  late Timer sliderTimer;
  var currentShowIndex = 0;

  @override
  void initState() {
    pageViewModelData.add(PageViewData(
      titleText: 'Atur Pemesananmu',
      subText:
          'KOSTin selalu membantu kamu dalam \n menemukan dan melakukan pemesanan kost.',
      assetsImage: Localfiles.introduction1,
    ));

    pageViewModelData.add(PageViewData(
      titleText: 'Layanan Kami',
      subText:
          'KOSTin saat ini hanya diperuntukkan bagi \n Mahasiswa POLIWANGI.',
      assetsImage: Localfiles.introduction2,
    ));

    pageViewModelData.add(PageViewData(
      titleText: 'Kenyamanan',
      subText:
          'KOSTin menyediakan kamar kos yang bersih, nyaman, aman dan terfasilitasi.',
      assetsImage: Localfiles.introduction3,
    ));

    sliderTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (currentShowIndex == 0) {
        pageController.animateTo(MediaQuery.of(context).size.width,
            duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 1) {
        pageController.animateTo(MediaQuery.of(context).size.width * 2,
            duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 2) {
        pageController.animateTo(0,
            duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    sliderTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              pageSnapping: true,
              onPageChanged: (index) {
                currentShowIndex = index;
              },
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                PagePopup(imageData: pageViewModelData[0]),
                PagePopup(imageData: pageViewModelData[1]),
                PagePopup(imageData: pageViewModelData[2]),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: pageController, // PageController
            count: 3,
            effect: WormEffect(
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: Theme.of(context).dividerColor,
                dotHeight: 5.0,
                dotWidth: 10.0,
                spacing: 5.0), // your preferred effect
            onDotClicked: (index) {},
          ),
          CommonButton(
            padding:
                const EdgeInsets.only(left: 48, right: 48, bottom: 8, top: 32),
            buttonText: ("login"),
            backgroundColor: Color(0xff217DA5),
            onTap: () {
              Get.toNamed(Routes.LOGINPAGE);
            },
          ),
          CommonButton(
            padding:
                const EdgeInsets.only(left: 48, right: 48, bottom: 32, top: 8),
            buttonText: ("register"),
            backgroundColor: Color(0xff58A5C6),
            onTap: () {
              Get.toNamed(Routes.SIGN_UP_SCREEN);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
