import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? strokeWidth;
  const CustomProgressIndicator({super.key, this.color, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: color ?? Colors.blue,
          strokeWidth: strokeWidth ?? 2,
        ),
      ),
    );
  }
}
