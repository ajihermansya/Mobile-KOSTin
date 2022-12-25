import 'package:flutter/material.dart';

class PagePopup extends StatelessWidget {
  final PageViewData imageData;

  const PagePopup({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 120,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  imageData.assetsImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              (imageData.titleText),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              (imageData.subText),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Color(0xff217DA5),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }
}

class PageViewData {
  final String titleText;
  final String subText;
  final String assetsImage;

  PageViewData({
    required this.titleText,
    required this.subText,
    required this.assetsImage,
  });
}
