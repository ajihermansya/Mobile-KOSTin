import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String iconImagePath;
  final String butoonText;
  final color1;
  final Function()? onPressed;

  const MyButton({
    super.key,
    required this.iconImagePath,
    required this.color1,
    required this.butoonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //icon
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(5),
            backgroundColor: color1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onPressed,
          child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              // color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(iconImagePath),
            ),
          ),
        ),
        SizedBox(height: 10),
        //text
        Text(
          butoonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.7),
          ),
        )
      ],
    );
  }
}
