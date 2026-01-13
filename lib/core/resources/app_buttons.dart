import 'package:flutter/material.dart';

import 'app_colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const MainButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(AppColors.primaryColor),
        minimumSize:Size(50, 55),
      ),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
