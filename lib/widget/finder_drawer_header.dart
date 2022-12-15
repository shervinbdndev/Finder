import 'package:flutter/material.dart';
import 'package:finder/colors/color.dart';
import 'package:finder/widget/finder_logo.dart';
import 'package:finder/widget/finder_text_font.dart';

class FinderDrawerHeader extends StatelessWidget {
  const FinderDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              FinderTextFont(
                text: 'Finder',
                fontSize: 40.0,
                fontColor: FinderColors.themePurple,
                weight: FontWeight.bold,
              ),
              SizedBox(height: 0.5),
              Padding(
                padding: EdgeInsets.only(right: 58.0),
                child: FinderTextFont(
                  text: 'Version 1.0.0',
                  fontSize: 10.0,
                  fontColor: FinderColors.themePurple,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(width: 8.0),
          const FinderLogo(
            width: 50.0,
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
