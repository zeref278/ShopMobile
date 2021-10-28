import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color, textColor;
  //final double width;
  final IconData iconData;
  final Icon tailIcon;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.white,
    this.textColor = Colors.black,
    required this.iconData,
    required this.tailIcon,
    //required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            Icon(
              iconData,
              color: textColor,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ),
            tailIcon
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ))),
      ),
    );
  }
}