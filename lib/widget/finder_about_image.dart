import 'package:flutter/material.dart';
import 'package:finder/colors/color.dart';

class FinderAboutImage extends StatelessWidget {
  const FinderAboutImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          color: FinderColors.themePurple,
          width: 4.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Image.asset(
          'assets/me.jpg',
          fit: BoxFit.cover,
          scale: 12.0,
        ),
      ),
    );
  }
}
