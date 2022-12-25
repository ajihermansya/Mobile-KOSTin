import 'package:flutter/material.dart';

import 'package:kostin/components/my_button.dart';
import 'package:kostin/widget/component_home/promo_menarik.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xfff6f8ff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  iconImagePath: "assets/icons/bill.png",
                  butoonText: "Bill",
                  color1: const Color(0xff605cf4),
                  onPressed: () {},
                ),
                MyButton(
                  iconImagePath: "assets/icons/history.png",
                  butoonText: "History",
                  color1: const Color(0xfffc77a6),
                  onPressed: () {},
                ),
                MyButton(
                  iconImagePath: "assets/icons/pulsa.png",
                  color1: const Color(0xff4391ff),
                  butoonText: "pulse",
                  onPressed: () {},
                ),
                MyButton(
                  iconImagePath: "assets/icons/more.png",
                  butoonText: "More",
                  color1: Color.fromARGB(255, 127, 67, 255),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          _buildtitle("Promo Menarik"),
          Promosis(),
          _buildtitle("Pilih Kost Andalanmu"),
          Promosis(),
          _buildtitle("Promo Menarik"),
          Promosis(),
          _buildtitle("Pilih Kost Andalanmu"),
          Promosis(),
        ],
      ),
    );
  }

  Widget _buildtitle(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      width: double.maxFinite,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }
}
