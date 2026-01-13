import 'package:final_project/core/resources/app_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String label, hint;
  final TextEditingController? controller;
  const PasswordField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return AppField(
      label: widget.label,
      hint: widget.hint,
      isHidden: isHidden,
      controller: widget.controller,
      suffixIcon: GestureDetector(
        onTap: () => setState(() {
          isHidden = !isHidden;
        }),
        child: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}
