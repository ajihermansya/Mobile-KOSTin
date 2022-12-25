import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kostin/constants/colors.dart';
import 'package:kostin/widget/component_home/category.dart';
import 'package:kostin/widget/component_home/header.dart';
import 'package:kostin/widget/component_home/search.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bottomBarItem = [
    'home',
    'home_search',
    'chat',
    'home-mark',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Transform(
              transform: Matrix4.identity()..rotateZ(20),
              origin: const Offset(150, 50),
              child: Image.asset(
                "assets/images/bg_liquid.png",
                width: 200,
              ),
            ),
            Positioned(
              right: 0,
              top: 200,
              child: Transform(
                transform: Matrix4.identity()..rotateZ(20),
                origin: const Offset(180, 100),
                child: Image.asset(
                  "assets/images/bg_liquid.png",
                  width: 200,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                const Header(),
                const Search(),
                const Category(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBootomNavigationBar(),
    );
  }

  Widget _buildBootomNavigationBar() {
    return Container(
      color: const Color(0xfff6f8ff),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
