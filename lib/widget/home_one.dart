import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kostin/widget/component_home_one/best_offer.dart';
import 'package:kostin/widget/component_home_one/catagories.dart';
import 'package:kostin/widget/component_home_one/custom_app_bar.dart';
import 'package:kostin/widget/component_home_one/listview_api.dart';
import 'package:kostin/widget/component_home_one/recomended_kost.dart';
import 'package:kostin/widget/component_home_one/welcome_text.dart';
import 'package:kostin/widget/component_home/promo_menarik.dart';
import 'package:kostin/widget/component_home/search.dart';
import 'package:kostin/widget/navbar.dart';

class HomeOne extends StatefulWidget {
  const HomeOne({super.key});

  @override
  State<HomeOne> createState() => _HomeOneState();
}

class _HomeOneState extends State<HomeOne> {
  final GlobalKey<ScaffoldState> _scaffooldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffooldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => _scaffooldKey.currentState!.openDrawer(),
          icon: SvgPicture.asset('assets/icons/menu.svg'),
        ),
        actions: [
          new IconButton(
              onPressed: () {},
              icon: new Icon(Icons.favorite_outlined,
                  color: Colors.grey.shade500)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeText(),
            const Search(),
            const Categori(),
            Recomndkost(),
            _buildtitle("Promo Menarik"),
            Promosis(),
            const Bestoffer(),
            //const listView(),
          ],
        ),
      ),
      //bottomNavigationBar: CustomBootomNavigationBar(),
    );
  }

  Widget _buildtitle(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      width: double.maxFinite,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
