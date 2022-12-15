import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finder/colors/color.dart';
import 'package:finder/pages/about_page.dart';
import 'package:finder/widget/finder_logo.dart';
import 'package:finder/widget/finder_appbar.dart';
import 'package:finder/constants/platform_urls.dart';
import 'package:finder/widget/finder_textfield.dart';
import 'package:finder/widget/finder_list_tile.dart';
import 'package:finder/widget/finder_text_font.dart';
import 'package:http_status_code/http_status_code.dart';
import 'package:finder/widget/finder_platform_box.dart';
import 'package:finder/widget/finder_drawer_header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Finder extends StatefulWidget {
  const Finder({super.key});

  @override
  State<Finder> createState() => _FinderState();
}

class _FinderState extends State<Finder> {
  final TextEditingController _controller = TextEditingController();

  FinderPlatformBox gitContainer = FinderPlatformBox(
    backgroundColor: Colors.white,
    color: FinderColors.grey,
    icon: FontAwesomeIcons.github,
    statusIcon: FontAwesomeIcons.circleInfo,
    text: 'Github',
  );

  FinderPlatformBox pypiContainer = FinderPlatformBox(
    backgroundColor: Colors.white,
    color: FinderColors.grey,
    icon: FontAwesomeIcons.python,
    statusIcon: FontAwesomeIcons.circleInfo,
    text: 'Pypi',
  );

  FinderPlatformBox redditContainer = FinderPlatformBox(
    backgroundColor: Colors.white,
    color: FinderColors.grey,
    icon: FontAwesomeIcons.redditAlien,
    statusIcon: FontAwesomeIcons.circleInfo,
    text: 'Reddit',
  );

  FinderPlatformBox linkedinContainer = FinderPlatformBox(
    backgroundColor: Colors.white,
    color: FinderColors.grey,
    icon: FontAwesomeIcons.linkedin,
    statusIcon: FontAwesomeIcons.circleInfo,
    text: 'Linkedin',
  );

  FinderPlatformBox instagramContainer = FinderPlatformBox(
    backgroundColor: Colors.white,
    color: FinderColors.grey,
    icon: FontAwesomeIcons.instagram,
    statusIcon: FontAwesomeIcons.circleInfo,
    text: 'Instagram',
  );

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
                color: FinderColors.themePurple,
              ),
              text: const FinderTextFont(
                text: 'Home',
                fontSize: 20.0,
                fontColor: FinderColors.themePurple,
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
                color: FinderColors.grey,
              ),
              text: const FinderTextFont(
                text: 'About',
                fontSize: 20.0,
                fontColor: FinderColors.grey,
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  FinderLogo(
                    width: 150.0,
                    height: 150.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: FinderTextField(
                  controller: _controller,
                  ontap: () async {
                    var username = _controller.text;
                    var githubResult =
                        await http.get(Uri.parse('$github/$username'));
                    var pypiResult =
                        await http.get(Uri.parse('$pypi/user/$username'));
                    // var instagramResult =
                    //     await http.get(Uri.parse('$instagram/$username'));
                    // var redditResult =
                    //     await http.get(Uri.parse('$reddit/user/$username'));
                    if (githubResult.statusCode == StatusCode.OK) {
                      setState(() {
                        gitContainer = const FinderPlatformBox(
                          backgroundColor: FinderColors.lightGreen,
                          color: FinderColors.darkGreen,
                          icon: FontAwesomeIcons.github,
                          statusIcon: FontAwesomeIcons.check,
                          text: 'Github',
                        );
                      });
                    } else if (githubResult.statusCode ==
                        StatusCode.NOT_FOUND) {
                      setState(() {
                        gitContainer = const FinderPlatformBox(
                          backgroundColor: FinderColors.lightRed,
                          color: FinderColors.darkRed,
                          icon: FontAwesomeIcons.github,
                          statusIcon: FontAwesomeIcons.xmark,
                          text: 'Github',
                        );
                      });
                    }
                    if (pypiResult.statusCode == StatusCode.OK) {
                      setState(() {
                        pypiContainer = const FinderPlatformBox(
                          backgroundColor: FinderColors.lightGreen,
                          color: FinderColors.darkGreen,
                          icon: FontAwesomeIcons.python,
                          statusIcon: FontAwesomeIcons.check,
                          text: 'Pypi',
                        );
                      });
                    } else if (pypiResult.statusCode == StatusCode.NOT_FOUND) {
                      setState(() {
                        pypiContainer = const FinderPlatformBox(
                          backgroundColor: FinderColors.lightRed,
                          color: FinderColors.darkRed,
                          icon: FontAwesomeIcons.python,
                          statusIcon: FontAwesomeIcons.xmark,
                          text: 'Pypi',
                        );
                      });
                    }
                    // if (instagramResult.statusCode == StatusCode.OK) {
                    //   setState(() {
                    //     instagramContainer = const FinderPlatformBox(
                    //       backgroundColor: FinderColors.lightGreen,
                    //       color: FinderColors.darkGreen,
                    //       icon: FontAwesomeIcons.python,
                    //       statusIcon: FontAwesomeIcons.check,
                    //       text: 'Instagram',
                    //     );
                    //   });
                    // } else if (instagramResult.statusCode ==
                    //     StatusCode.NOT_FOUND) {
                    //   setState(() {
                    //     instagramContainer = const FinderPlatformBox(
                    //       backgroundColor: FinderColors.lightRed,
                    //       color: FinderColors.darkRed,
                    //       icon: FontAwesomeIcons.python,
                    //       statusIcon: FontAwesomeIcons.xmark,
                    //       text: 'Instagram',
                    //     );
                    //   });
                    // }
                    // if (redditResult.statusCode == StatusCode.OK) {
                    //   setState(() {
                    //     redditContainer = const FinderPlatformBox(
                    //       backgroundColor: FinderColors.lightGreen,
                    //       color: FinderColors.darkGreen,
                    //       icon: FontAwesomeIcons.redditAlien,
                    //       statusIcon: FontAwesomeIcons.check,
                    //       text: 'Reddit',
                    //     );
                    //   });
                    // } else if (redditResult.statusCode == StatusCode.NOT_FOUND) {
                    //   setState(() {
                    //     redditContainer = const FinderPlatformBox(
                    //       backgroundColor: FinderColors.lightRed,
                    //       color: FinderColors.darkRed,
                    //       icon: FontAwesomeIcons.redditAlien,
                    //       statusIcon: FontAwesomeIcons.xmark,
                    //       text: 'Reddit',
                    //     );
                    //   });
                    // }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      redditContainer,
                      instagramContainer,
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      gitContainer,
                      pypiContainer,
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const FinderPlatformBox(
                        backgroundColor: Colors.white,
                        color: FinderColors.grey,
                        icon: FontAwesomeIcons.twitter,
                        statusIcon: FontAwesomeIcons.circleInfo,
                        text: 'Twitter',
                      ),
                      linkedinContainer,
                    ],
                  ),
                ],
              ),
            ),
            Provider.of<InternetConnectionStatus>(context) ==
                    InternetConnectionStatus.disconnected
                ? const Padding(
                    padding: EdgeInsets.only(top: 85.0),
                    child: FinderTextFont(
                      text: 'Not Connected',
                      fontSize: 20.0,
                      fontColor: FinderColors.darkRed,
                      weight: FontWeight.bold,
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.only(top: 85.0),
                    child: FinderTextFont(
                      text: 'Connected',
                      fontSize: 20.0,
                      fontColor: FinderColors.darkGreen,
                      weight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
