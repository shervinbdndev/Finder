import 'package:flutter/material.dart';
import 'package:finder/widget/finder_text_font.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FinderPlatformBox extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Color color;
  final String text;
  final IconData statusIcon;

  const FinderPlatformBox({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.color,
    required this.text,
    required this.statusIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.0,
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          width: 2.0,
          color: color,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: <Widget>[
                FaIcon(
                  icon,
                  color: color,
                ),
                const SizedBox(width: 5.0),
                FinderTextFont(
                  text: text,
                  fontSize: 13.0,
                  fontColor: color,
                  weight: FontWeight.normal,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: FaIcon(
                  statusIcon,
                  color: color,
                  size: 20.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
