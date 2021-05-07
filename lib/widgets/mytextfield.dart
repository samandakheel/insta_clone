import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextInputType textInputType;
  final String hint;
  final bool isPassword;
  final ValueChanged<String> onChanged;
  MyTextField({this.textInputType, this.hint, this.isPassword, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: this.isPassword ?? false,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Color(0xffF8F9F8),
        filled: true,
        contentPadding: EdgeInsets.all(
          10.0,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffD1D8D1),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffD1D8D1),
            width: 1,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
