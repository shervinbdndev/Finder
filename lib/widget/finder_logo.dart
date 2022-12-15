import 'package:flutter/material.dart';

class FinderLogo extends StatelessWidget {
  final double width;
  final double height;

  const FinderLogo({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.5,
      child: SizedBox(
        width: width,
        height: height,
        child: Image.asset(
          'assets/logo.png',
        ),
      ),
    );
  }
}
