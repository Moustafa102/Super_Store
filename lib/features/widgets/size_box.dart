import 'package:flutter/material.dart';

class SizeBox extends StatelessWidget {
  final String input;
  final int inputColor;
  const SizeBox({
    super.key, required this.input, required this.inputColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffCFCDCD)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Text(
          input,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            color: Color(inputColor)
          ),
        ),
      ),
    );
  }
}