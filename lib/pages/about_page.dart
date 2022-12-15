import 'dart:io';
import 'package:flutter/material.dart';
import 'package:finder/colors/color.dart';
import 'package:finder/pages/main_page.dart';
import 'package:finder/widget/finder_appbar.dart';
import 'package:finder/widget/finder_list_tile.dart';
import 'package:finder/widget/finder_text_font.dart';
import 'package:finder/widget/finder_about_image.dart';
import 'package:finder/widget/finder_drawer_header.dart';
import 'package:finder/widget/finder_about_textinfo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FinderAboutPage extends StatelessWidget {
  const FinderAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const FinderAppbar(),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            const FinderDrawerHeader(),
            FinderListTile(
              icon: const FaIcon(
                FontAwesomeIcons.house,
                size: 20.0,
                color: FinderColors.grey,
              ),
              text: const FinderTextFont(
                text: 'Home',
                fontSize: 20.0,
                fontColor: FinderColors.grey,
                weight: FontWeight.normal,
              ),
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Finder(),
                  ),
                );
              },
            ),
            FinderListTile(
              icon: const FaIcon(
                FontAwesomeIcons.circleInfo,
                size: 20.0,
                color: FinderColors.themePurple,
              ),
              text: const FinderTextFont(
                text: 'About',
                fontSize: 20.0,
                fontColor: FinderColors.themePurple,
                weight: FontWeight.normal,
              ),
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FinderAboutPage(),
                  ),
                );
              },
            ),
            FinderListTile(
              icon: const FaIcon(
                FontAwesomeIcons.outdent,
                size: 20.0,
                color: FinderColors.grey,
              ),
              text: const FinderTextFont(
                text: 'Exit',
                fontSize: 20.0,
                fontColor: FinderColors.grey,
                weight: FontWeight.normal,
              ),
              ontap: () {
                exit(0);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            FinderAboutImage(),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: FinderAboutTextInfo(),
            ),
          ],
        ),
      ),
    );
  }
}
