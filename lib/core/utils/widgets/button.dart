import 'package:flutter/material.dart';

import '../../core.export.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? focusColor;
  final Color? hoverColor;
  final double? height;
  final double? width;
  final double? shape;
  final TextStyle? style;
  final double? horizontalPadding;
  final Color? color;
  final VoidCallback? onPressed;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.height,
    this.color = Colors.amber,
    required this.onPressed,
    this.textColor,
    this.horizontalPadding,
    this.style,
    this.width,
    this.shape,
    this.splashColor = Colors.transparent,
    this.highlightColor=Colors.transparent,
    this.focusColor=Colors.transparent,
    this.hoverColor=Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontalPadding != null
          ? EdgeInsets.symmetric(horizontal: horizontalPadding!)
          : const EdgeInsets.symmetric(horizontal: 0.0),
      child: MaterialButton(
        splashColor:splashColor,
        highlightColor: highlightColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        elevation: 0.0,
        color: color ?? Colors.grey,
        height: height ?? 50.0,
        minWidth: width,
        textColor: textColor ?? Colors.white,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(shape ?? 4.0)),
        child: Text(
          text!,
          style: style,
        ),
      ),
    );
  }
}