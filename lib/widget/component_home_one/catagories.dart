import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Categori extends StatefulWidget {
  const Categori({super.key});

  @override
  State<Categori> createState() => _CategoriState();
}

class _CategoriState extends State<Categori> {
  final categoriesList = [
    "Top Recomended",
    "Near You",
    "Agency recomended",
    "Most pupular"
  ];
  int currentSelect = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: (() {
                  setState(() {
                    currentSelect = index;
                  });
                }),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: currentSelect == index
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    width: 3,
                  ))),
                  child: Text(
                    categoriesList[index],
                    style: TextStyle(
                      color: currentSelect == index
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: currentSelect == index ? 16 : 14,
                      fontWeight: currentSelect == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
          separatorBuilder: (_, indek) => SizedBox(
                width: 15,
              ),
          itemCount: categoriesList.length),
    );
  }
}
