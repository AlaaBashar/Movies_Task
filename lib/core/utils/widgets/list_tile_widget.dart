import 'package:flutter/material.dart';

import '../../core.export.dart';

class ListTileWidget extends StatelessWidget {
  final Widget? title;
  final Color? iconColor;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? trailing;
  final Widget? subtitle;
  final double? iconSize;


  const ListTileWidget({
    Key? key,
    this.title,
    this.iconColor,
    this.onTap,
    this.leading ,
    this.trailing,
    this.subtitle,
    this.iconSize ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      title: title,
      subtitle: subtitle,
      leading:leading,
      trailing: trailing,
      onTap: onTap ?? (){},
    );
  }
}
