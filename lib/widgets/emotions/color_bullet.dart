import 'package:flutter/material.dart';

class ColorBullet extends StatelessWidget {
  final Color color;

  const ColorBullet(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
