import 'package:flutter/material.dart';

class MyInputText extends StatefulWidget {
  BorderRadius? cornerRadius;
  double? width, height, wordSpacing;
  Color? backgroundColor, accentColor, textColor;
  String? placeholder, fontFamily;
  Icon? prefixIcon, suffixIcon;
  TextInputType? inputType;
  EdgeInsets? margin;
  Duration? duration;
  VoidCallback? onClickSuffix;
  TextBaseline? textBaseline;
  FontStyle? fontStyle;
  FontWeight? fontWeight;
  bool? autofocus, autocorrect, enabled, obscureText, isShadow, isRequire,readOnly;
  FocusNode? focusNode;
  int? maxLength, minLines, maxLines;
  ValueChanged<String>? onChanged, onSubmitted;
  GestureTapCallback? onTap;
  TextEditingController? controller;
  

  MyInputText(
      {Key? key,
      required this.width,
      required this.height,
      this.readOnly = false,
      this.prefixIcon,
      required this.inputType,
      this.controller,
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
            padding: EdgeInsets.only(left: 15.0),
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
                    child: Icon(
                      widget.suffixIcon!.icon,
                      color: widget.textColor,
                    ),
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
                        child: Icon(
                          widget.prefixIcon!.icon,
                          color: isFocus
                              ? widget.backgroundColor
                              : widget.accentColor,
                        ),
                      ),
                    ] else ...[
                      SizedBox(
                        width: 10.0,
                      )
                    ],
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.only(
                            right: widget.suffixIcon != null ? 50 : 10, top: 3),
                        child: TextField(
                          controller: widget.controller,
                          readOnly: widget.readOnly!,
                          cursorWidth: 2,
                          obscureText: widget.obscureText!,
                          keyboardType: widget.inputType,
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
                          maxLength: widget.maxLength,
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
                          onSubmitted: (t) {
                            setState(() {
                              isFocus = false;
                            });
                            widget.onSubmitted!(t);
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
