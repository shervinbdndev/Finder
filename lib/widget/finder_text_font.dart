import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinderTextFont extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight weight;

  const FinderTextFont({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontColor,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aldrich(
        textStyle: TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: weight,
        ),
      ),
    );
  }
}
