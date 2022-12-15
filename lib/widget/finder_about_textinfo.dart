import 'package:flutter/material.dart';
import 'package:finder/colors/color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:finder/constants/platform_urls.dart';
import 'package:finder/widget/finder_text_font.dart';

class FinderAboutTextInfo extends StatelessWidget {
  const FinderAboutTextInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const FinderTextFont(
                text: 'Creator:',
                fontSize: 25.0,
                fontColor: FinderColors.themePurple,
                weight: FontWeight.bold,
              ),
              const SizedBox(width: 10.0),
              FinderTextFont(
                text: 'Shervin Badanara',
                fontSize: 20.0,
                fontColor:
                    brightness == Brightness.dark ? Colors.white : Colors.black,
                weight: FontWeight.normal,
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const FinderTextFont(
                text: 'Github:',
                fontSize: 25.0,
                fontColor: FinderColors.themePurple,
                weight: FontWeight.bold,
              ),
              const SizedBox(width: 10.0),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    await launchUrl(
                      Uri.parse('$github/shervinbdndev/'),
                    );
                  },
                  child: FinderTextFont(
                    text: '@shervinbdndev',
                    fontSize: 20.0,
                    fontColor: brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    weight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
