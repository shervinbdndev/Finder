import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finder/colors/color.dart';

class FinderTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback ontap;

  const FinderTextField({
    super.key,
    required this.controller,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370.0,
      height: 60,
      child: TextField(
        controller: controller,
        style: GoogleFonts.aldrich(
          color: FinderColors.grey,
          fontWeight: FontWeight.normal,
          fontSize: 15.0,
        ),
        cursorColor: FinderColors.themePurple,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              width: 2.0,
              color: FinderColors.themePurple,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              width: 2.0,
              color: FinderColors.themePurple,
            ),
          ),
          hintText: 'Enter the ID you want to find . . .',
          hintStyle: GoogleFonts.aldrich(
            color: FinderColors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 13.0,
          ),
          isDense: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
            ),
            child: Text(
              '@ ',
              style: GoogleFonts.aldrich(
                color: FinderColors.grey,
                fontWeight: FontWeight.normal,
                fontSize: 25.0,
              ),
            ),
          ),
          suffixIcon: Container(
            height: 5.0,
            width: 5.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: FinderColors.themePurple,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: ontap,
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
