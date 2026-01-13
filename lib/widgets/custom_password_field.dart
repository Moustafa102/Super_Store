

import 'package:flutter/material.dart';

import 'app_field.dart';

class CustomPasswordField extends StatefulWidget {

  final String hintText;
  final TextEditingController? controller;
  const CustomPasswordField({super.key, required this.hintText, this.controller});


  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return AppField(
      controller: widget.controller,
        hintText: widget.hintText,
        endIcon: GestureDetector(
          onTap: (){
            setState(() {
              isHidden=! isHidden;
            });
          },

          child: isHidden?
          Icon(
              Icons.visibility_off_rounded
          ):

          Icon(
              Icons.remove_red_eye
          ),

        ),
        obscureText: isHidden,
      hint: "Enter your User Name or email address",);
  }
}
