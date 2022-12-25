import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kostin/components/circle_icon_button.dart';
import 'package:kostin/models/kost.dart';

class Recomndkost extends StatelessWidget {
  Recomndkost({super.key});
  final recommendedList = Kost.generateRecommended();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 340,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                height: 300,
                width: 230,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(recommendedList[index].imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      right: 15,
                      top: 15,
                      child: CircleButton(
                          iconUrl: "assets/icons/mark.svg",
                          color1: Theme.of(context).accentColor),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.white54,
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recommendedList[index].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    recommendedList[index].addres,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              CircleButton(
                                  iconUrl: "assets/icons/mark.svg",
                                  color1: Theme.of(context).accentColor),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
          separatorBuilder: (_, index) => SizedBox(
                width: 20,
              ),
          itemCount: recommendedList.length),
    );
  }
}
