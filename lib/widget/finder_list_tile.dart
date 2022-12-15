import 'package:flutter/material.dart';

class FinderListTile extends StatelessWidget {
  final Widget icon;
  final Widget text;
  final VoidCallback ontap;

  const FinderListTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: text,
      onTap: ontap,
    );
  }
}
