import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final Widget child;

  const TextDivider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.9,
      child: Row(
        children: <Widget>[
          Container(
            width: 30,
            child: Divider(color: Colors.grey,
            thickness: 1,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: child,
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              height: 1.5,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}