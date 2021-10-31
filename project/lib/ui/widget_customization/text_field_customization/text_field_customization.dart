import 'package:flutter/material.dart';
import 'package:project/constants.dart';

class TextFieldCustomization extends StatelessWidget {
  final Icon? icon;
  final String label;
  final String hintText;
  final bool isEdit;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool isExpand;
  final TextInputType? inputType;

  TextFieldCustomization(
      {this.icon,
      required this.label,
      required this.hintText,
      required this.isEdit,
      this.isExpand = false,
      this.inputType,
      this.onTap,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: TextField(
          keyboardType: inputType,
          maxLines: isExpand ? 4 : 1,
          onTap: onTap,
          controller: controller,
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.teal),
          readOnly: !isEdit,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
              labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              hintStyle:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.teal),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              icon: icon,
              hoverColor: defaultPrimaryColor,
              border: OutlineInputBorder(
                  gapPadding: 2, borderRadius: BorderRadius.circular(10)),
              labelText: label,
              hintText: hintText),
        ));
  }
}
