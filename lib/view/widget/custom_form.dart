import 'package:flutter/material.dart';
Widget myTextField(
    {TextEditingController? controller,
    String? labelText,
    String? hintText,
    String helperText = '',
    TextInputType? keyboardType,
    bool? readOnly = false,
    bool numberOnly = false,
    FormFieldValidator<String>? validator,
    Function(String)? onChanged,
    GestureTapCallback? onTap,
    double cursorWidth = 2.0,
    bool obscureText = false,
    bool autocorrect = true,
    TextStyle? style,
    StrutStyle? strutStyle,
    bool autofocus = false,
    int? maxLines = 1,
    int? minLines = 1,
    bool? enabled,
    FocusNode? focusNode,
    TextInputAction? textInputAction,
    InputDecoration? decoration = const InputDecoration(),
    Widget? suffixIcon,
    double? paddingVertical,
    bool textArea = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 10.0),
    child: TextFormField(
        maxLines: maxLines! > 1
            ? maxLines
            : textArea == true
                ? 10
                : 1,
        minLines: minLines! > 1
            ? minLines
            : textArea == true
                ? 3
                : 1,
        controller: controller,
        keyboardType: keyboardType != null
            ? keyboardType
            : (numberOnly ? TextInputType.number : TextInputType.text),
        readOnly: readOnly!,
        onChanged: onChanged,
        enabled: enabled,
        validator: validator,
        autocorrect: autocorrect,
        focusNode: focusNode,
        onTap: onTap,
        cursorWidth: 2,
        obscureText: obscureText,
        style: style,
        autofocus: autofocus,
        strutStyle: strutStyle,
        decoration: decoration,
        textInputAction: textInputAction),
  );
}

class MyInputText extends StatefulWidget {
  final BorderRadius? cornerRadius;
  final double? width, height, wordSpacing;
  final Color? backgroundColor, accentColor, textColor;
  final String? placeholder, fontFamily;
  final Widget? prefixIcon, suffixIcon;
  final EdgeInsets? margin;
  final Duration? duration;
  final VoidCallback? onClickSuffix;
  final TextBaseline? textBaseline;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;

  final TextInputType? keyboardType;

  final FormFieldValidator<String>? validator;
  final bool? autofocus,
      autocorrect,
      enabled,
      obscureText,
      isShadow,
      isRequire,
      readOnly;
  final FocusNode? focusNode;
  final int? maxLength, minLines, maxLines;
  final ValueChanged<String>? onChanged, onSubmitted;
  final GestureTapCallback? onTap;
  final TextEditingController? controller;

  MyInputText(
      {Key? key,
      required this.width,
      required this.height,
      this.readOnly = false,
      this.prefixIcon,
      this.keyboardType,
      this.controller,
      this.validator,
      this.isRequire = false,
      this.suffixIcon,
      this.duration = const Duration(milliseconds: 500),
      this.margin = const EdgeInsets.all(10),
      this.obscureText = false,
      this.backgroundColor = const Color(0xffffffff),
      this.cornerRadius = const BorderRadius.all(Radius.circular(10)),
      this.textColor = const Color(0xff000000),
      this.accentColor = Colors.white,
      this.placeholder = "Placeholder",
      this.isShadow = true,
      this.onClickSuffix,
      this.wordSpacing,
      this.textBaseline,
      this.fontFamily,
      this.fontStyle,
      this.fontWeight,
      this.autofocus = false,
      this.autocorrect = false,
      this.focusNode,
      this.enabled = true,
      this.maxLength,
      this.maxLines,
      this.minLines,
      this.onChanged,
      this.onTap,
      this.onSubmitted})
      : super(key: key);

  @override
  _MyInputTextState createState() => _MyInputTextState();
}

class _MyInputTextState extends State<MyInputText> {
  bool isFocus = false;

  @override
  Widget build(BuildContext context) {
    var mStyle = TextStyle(
      fontFamily: widget.fontFamily,
      fontStyle: widget.fontStyle,
      fontWeight: widget.fontWeight,
      wordSpacing: widget.wordSpacing,
      textBaseline: widget.textBaseline,
      fontSize: 18,
      letterSpacing: 2,
      color: widget.textColor,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            // padding: EdgeInsets.only(left: 15.0),
            child: widget.isRequire!
                ? RichText(
                    text: TextSpan(
                        text: widget.placeholder!,
                        style: mStyle,
                        children: <TextSpan>[
                        TextSpan(
                          text: ' *',
                          style: mStyle.copyWith(color: Colors.red),
                        )
                      ]))
                : Text(
                    widget.placeholder!,
                    style: mStyle,
                  ) //isRequire
            ),
        AnimatedContainer(
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              boxShadow: widget.isShadow!
                  ? [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 2, spreadRadius: 1)
                    ]
                  : [BoxShadow(spreadRadius: 0, blurRadius: 0)],
              borderRadius: widget.cornerRadius,
              color: widget.suffixIcon == null
                  ? isFocus
                      ? widget.accentColor
                      : widget.backgroundColor
                  : widget.backgroundColor),
          child: Stack(
            children: <Widget>[
              if (widget.suffixIcon != null) ...[
                Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedContainer(
                    width: isFocus ? 500 : 40,
                    height: isFocus ? widget.height : 40,
                    margin: EdgeInsets.only(right: isFocus ? 0 : 7),
                    duration: widget.duration!,
                    decoration: BoxDecoration(
                      borderRadius: isFocus
                          ? widget.cornerRadius
                          : BorderRadius.all(Radius.circular(60)),
                      color: widget.accentColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (widget.onClickSuffix != null) {
                      widget.onClickSuffix!();
                    }
                    setState(() {
                      isFocus ? isFocus = false : isFocus = true;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 5),
                    alignment: Alignment.centerRight,
                    child: widget.suffixIcon!,
                  ),
                )
              ],
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    if (widget.prefixIcon != null) ...[
                      Expanded(
                        flex: 1,
                        child: widget.prefixIcon!,
                      ),
                    ] else ...[
                      SizedBox(
                        width: 10.0,
                      )
                    ],
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.only(right: widget.suffixIcon != null ? 50 : 10, top: 3),
                        child: myTextField(
                          controller: widget.controller,
                          readOnly: widget.readOnly!,
                          cursorWidth: 2,
                          obscureText: widget.obscureText!,
                          keyboardType: widget.keyboardType,
                          validator: widget.validator,
                          style: TextStyle(
                            fontFamily: widget.fontFamily,
                            fontStyle: widget.fontStyle,
                            fontWeight: widget.fontWeight,
                            wordSpacing: widget.wordSpacing,
                            textBaseline: widget.textBaseline,
                            fontSize: 18,
                            letterSpacing: 2,
                            color: widget.textColor,
                          ),
                          autofocus: widget.autofocus!,
                          autocorrect: widget.autocorrect!,
                          focusNode: widget.focusNode,
                          enabled: widget.enabled,
                          maxLines: widget.maxLines,
                          minLines: widget.minLines,
                          onChanged: widget.onChanged,
                          onTap: () {
                            setState(() {
                              isFocus = true;
                            });
                            if (widget.onTap != null) {
                              widget.onTap!();
                            }
                          },

                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey.shade300),
                              hintText: widget.placeholder,
                              border: InputBorder.none),
                          //cursorColor:  isFocus ? widget.accentColor : widget.backgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          duration: widget.duration!,
        ),
      ],
    );
  }
}
