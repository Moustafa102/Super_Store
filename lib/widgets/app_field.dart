import 'package:flutter/material.dart';

class AppField extends StatelessWidget {
  const AppField({
    super.key, required this.hintText, required this.endIcon, required this.obscureText, required this.hint, this.controller,
  });
  final String hint;
  final TextEditingController? controller;

  final String hintText;
  final Widget endIcon;
  final bool obscureText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          filled: true,
          suffixIcon: endIcon,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue.shade400,
              )
          ),

          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              )
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Color(0xffAC8E71)
          )
      ),
    );
  }
}
