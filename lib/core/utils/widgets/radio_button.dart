import 'package:flutter/material.dart';

class RadioButtonApp extends StatelessWidget {
  final String? title;
  final TextStyle? textStyle;
  final dynamic groupValue;
  final dynamic value;
  final bool? toggleAble;
  final Color? activeColor;
  final int? flex;

  const RadioButtonApp({
    Key? key,
    this.title='',
    this.textStyle,
    required this.groupValue,
    this.toggleAble = false,
    this.value,
    this.activeColor= Colors.green,
    this.flex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$title',style: textStyle,),
      leading:Radio(
        value:1 ,
        groupValue:groupValue,
        onChanged: (value) {},
        activeColor: activeColor,
        toggleable: true,
      ),
    );
  }
}
