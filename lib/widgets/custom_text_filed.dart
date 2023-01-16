import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled({this.onChanged, this.hintText, this.obscureText, this.type});
  Function(String)? onChanged;
  String? hintText;
  bool? obscureText;
  TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType: type,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
