import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppField extends StatelessWidget {
  final String? label;
  final dynamic hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isHidden;
  final bool? hasLabel;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  const AppField({
    super.key,
    this.label,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.isHidden,
    this.controller,
    this.hasLabel,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasLabel ?? true
            ? Text(label ?? "", style: TextStyle(fontSize: 16))
            : SizedBox(),
        TextFormField(
          controller: controller,
          obscureText: isHidden ?? false,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hint: hint is String ?Text(hint, style: TextStyle(fontSize: 16, color: Color(AppColors.textFieldColor)))
                  : hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(AppColors.textFieldBorderColor),
              ),
            ),

          ),
          onFieldSubmitted: onFieldSubmitted ,
        ),
      ],
    );
  }
}
