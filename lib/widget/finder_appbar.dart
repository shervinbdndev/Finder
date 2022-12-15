import 'package:flutter/material.dart';
import 'package:finder/colors/color.dart';
import 'package:finder/widget/finder_text_font.dart';

class FinderAppbar extends StatelessWidget implements PreferredSizeWidget {
  const FinderAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: FinderColors.themePurple,
      title: const FinderTextFont(
        text: 'Finder',
        fontSize: 25.0,
        fontColor: Colors.white,
        weight: FontWeight.bold,
      ),
    );
  }
}
