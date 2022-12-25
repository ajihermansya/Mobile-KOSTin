import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleButton extends StatelessWidget {
  final String iconUrl;
  final Color color1;
  const CircleButton({Key? key, required this.iconUrl, required this.color1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color1,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(iconUrl),
    );
  }
}
