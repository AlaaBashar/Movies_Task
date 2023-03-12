import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core.export.dart';


class TextFieldApp extends StatelessWidget {
  final double? height;
  final double? width;
  final int? maxLines;
  final int? minLines;
  final double? cursorWidth;
  final double? cursorHeight;
  final double? borderRadius;
  final double? borderSideWidth;
  final double? contentVerticalPadding;
  final double? contentHorizontalPadding;
  final Color? cursorColor;
  final Color? borderColor;
  final Color? fillColor;
  final TextAlignVertical? textAlignVertical;
  final Color? enabledBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final bool? readOnly;
  final bool? isFilled;
  final bool? enable;
  final bool? showCursor;
  final bool? obscureText;
  final bool? autofocus;
  final bool? expands;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextStyle? suffixStyle;
  final TextAlign? textAlign;
  final String? hintText;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;

  const TextFieldApp({
    Key? key,
    this.height,
    this.maxLines = 1,
    this.cursorWidth,
    this.cursorHeight,
    this.borderRadius,
    this.borderSideWidth =1.0,
    this.cursorColor,
    this.borderColor,
    this.inputFormatters,
    this.validator,
    this.readOnly ,
    this.showCursor,
    this.obscureText,
    this.onTap,
    this.onChanged,
    this.labelText,
    this.labelStyle,
    this.suffixIcon,
    required this.controller,
    this.enable = true,
    this.prefixIcon,
    this.contentVerticalPadding,
    this.contentHorizontalPadding,
    this.fillColor,
    this.isFilled = false,
    this.textInputType,
    this.onSaved,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.done,
    this.style,
    this.textAlign,
    this.hintText,
    this.hintStyle,
    this.width,
    this.autofocus = false,
    this.focusNode,
    this.suffix,
    this.suffixStyle,
    this.enabledBorderColor,
    this.expands =false,
    this.minLines = 1,
    this.textAlignVertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: TextFormField(
        expands:expands!,
        style: style ?? const TextStyle(),
        enabled: enable,
        autofocus: autofocus!,
        focusNode:focusNode ,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
        minLines: minLines,
        controller: controller,
        textAlignVertical:textAlignVertical ?? TextAlignVertical.center,
        inputFormatters: inputFormatters ?? [] ,
        validator: validator ?? (value){},
        readOnly:readOnly ??false,
        obscureText:obscureText ?? false,
        cursorWidth:cursorWidth ?? 1,
        showCursor:showCursor ?? true,
        cursorColor: cursorColor ?? Colors.red,
        cursorHeight: cursorHeight ?? 20,
        keyboardType:textInputType ?? TextInputType.text,
        onTap: onTap ?? (){},
        onChanged: onChanged ?? (text){},
        onSaved: onSaved ?? (text){},
        onFieldSubmitted: onFieldSubmitted ?? (text){},
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText:hintText??'',
          hintStyle:hintStyle ?? const TextStyle(),
          filled: isFilled,
          fillColor: fillColor ?? Colors.grey,
          contentPadding: EdgeInsets.symmetric(vertical: contentVerticalPadding ?? 0.0, horizontal: contentHorizontalPadding ?? 0.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(color:borderColor?? Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius ?? 2.0),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide:  BorderSide(color: enabledBorderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius ?? 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: borderColor?? Colors.transparent, width: borderSideWidth!),
            borderRadius: BorderRadius.circular(borderRadius ?? 2.0),
          ),
          errorStyle: const TextStyle(fontSize: 0.00,),
          errorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 2.0),
              borderSide: const BorderSide(
                color: Colors.red,
                style: BorderStyle.solid
              )

          ),
          labelText: labelText,
          labelStyle:labelStyle ?? const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: '',
            fontWeight: FontWeight.w500,
          ),
          suffixIcon:suffixIcon == null ? null : Padding(padding: const EdgeInsets.all(0.0), child: suffixIcon,),
          prefixIcon:prefixIcon == null ? null : Padding(padding: const EdgeInsets.all(0.0), child: prefixIcon,),
          suffix: suffix,
          suffixStyle:suffixStyle ?? const TextStyle(),

        ),
      ),
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final double? height;
  final TextEditingController controller;
  final bool enableInteractiveSelection;
  final TextInputType? type;
  final int? maxLength;
  final bool radiusSide;
  final bool? obscureText;
  final bool enableInput;
  final bool showCursor;
  final bool isExpands;
  final bool isRTL ;
  final bool readOnly;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Color? fillColor;
  final Color? borderSideColor;
  final TextStyle? hintStyle;
  final EdgeInsets? margin;
  final TextAlign? textAlign;
  final VoidCallback? onActionComplete;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final double? width;
  final Widget? suffixIcon;
  final double? paddingIcon;
  final double marginHorizontal;
  final BorderRadius? borderRadius;
  const TextFieldWidget(
      {Key? key,
        required this.controller,
        required this.hintText,
        this.enableInteractiveSelection = true,
        this.type,
        this.maxLength,
        this.obscureText,
        this.enableInput = true,
        this.isRTL = true,
        this.maxLines,
        this.prefixIcon,
        this.radiusSide = true,
        this.validator,
        this.margin,
        this.readOnly = false,
        this.onTap,
        this.onChanged,
        this.textAlign,
        this.onActionComplete,
        this.inputFormatters,
        this.width,
        this.suffixIcon,
        this.paddingIcon,
        this.marginHorizontal = 15.0,
        this.borderRadius,
        this.showCursor = false,
       this.height = 40.0,
    this.isExpands = false,
    this.fillColor,
    this.suffix,
    this.borderSideColor, this.hintStyle,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String text = "";

  @override
  void initState() {
    super.initState();

    text = widget.controller.text ;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:widget.isRTL ?  TextDirection.rtl:TextDirection.ltr,
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: Theme.of(context).textTheme.bodyText2!.color,),
        child: Container(
          height: widget.height,
          width: widget.width ?? double.infinity,
          margin: widget.margin,
          child: Material(
            elevation: 16.0,
            borderRadius: widget.radiusSide
                ? widget.borderRadius ?? BorderRadius.circular(8.0)
                : const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0)),
            color: Colors.transparent,
            child: TextFormField(
              expands: widget.isExpands,
              controller: widget.controller,
              textDirection:widget.isRTL ?  TextDirection.rtl : TextDirection.ltr ,
              style: const TextStyle(color: Colors.black),
              enabled: widget.enableInput ,
              keyboardType: widget.type ?? TextInputType.text,
              autofocus: false,
              inputFormatters: widget.inputFormatters,
              maxLines: widget.type == TextInputType.multiline
                  ? null
                  : widget.maxLines ?? 1,
              textAlign: widget.textAlign ?? TextAlign.start,
              validator: widget.validator,
              readOnly: widget.readOnly ,
              showCursor: widget.showCursor,
              onChanged: (text) {
                setState(() {
                  this.text = text;
                });

                widget.onChanged?.call(text);
              },
              maxLength: widget.maxLength,
              obscureText: widget.obscureText ?? false,
              onTap: widget.onTap,
              cursorWidth: 2,

              ///onEditingComplete: widget.onActionComplete ?? () => FocusScope.of(context).nextFocus(),
              decoration: InputDecoration(
                errorStyle: const TextStyle(fontSize: 0.01,),

                hintTextDirection: widget.isRTL ? TextDirection.rtl : TextDirection.ltr,
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ??const TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: ''),
                counterText:'',
                border: OutlineInputBorder(
                  borderRadius: widget.radiusSide
                      ? widget.borderRadius ?? BorderRadius.circular(8.0)
                      : const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)),
                  borderSide: const BorderSide(
                    style: BorderStyle.none,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(2)),

                disabledBorder: OutlineInputBorder(
                  borderRadius: widget.radiusSide
                      ? widget.borderRadius ?? BorderRadius.circular(8.0)
                      : const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color:Colors.red ),
                    borderRadius: BorderRadius.circular(2),),
                errorBorder: OutlineInputBorder(
                  borderRadius: widget.radiusSide
                      ? widget.borderRadius ?? BorderRadius.circular(8.0)
                      : const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),

                filled: true,
                fillColor: widget.fillColor ??Theme.of(context).scaffoldBackgroundColor,
                prefixIcon: widget.prefixIcon,
                suffix:widget.suffix ,
                suffixIcon: widget.suffixIcon == null ? null : Padding(padding: const EdgeInsets.all(0.0), child: widget.suffixIcon,),
                contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

