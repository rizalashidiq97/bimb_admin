import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final String label;
  final bool border;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode nextfocusNode;
  final bool readOnly;
  final void Function() onTap;
  final void Function(String) onChange;
  final TextEditingController controller;
  final TextInputType keyboard;
  final bool obsecureText;
  final String errorText;
  final int errorMaxLines;
  final Widget icon;
  final TextStyle style;

  const TextFormWidget({
    Key key,
    this.label,
    this.border = true,
    this.textInputAction,
    this.focusNode,
    this.nextfocusNode,
    this.readOnly,
    this.onTap,
    this.controller,
    this.errorText,
    this.keyboard,
    this.onChange,
    this.obsecureText = false,
    this.errorMaxLines = 1,
    this.icon,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        readOnly: readOnly ?? false,
        textInputAction: textInputAction ?? TextInputAction.next,
        focusNode: focusNode,
        obscureText: obsecureText,
        onSubmitted: (_) {
          FocusScope.of(context).requestFocus(nextfocusNode);
        },
        keyboardType: keyboard ?? TextInputType.text,
        onTap: onTap,
        style: style ?? TextStyle(fontSize: 12),
        decoration: InputDecoration(
            icon: icon,
            errorMaxLines: errorMaxLines,
            errorText: errorText,
            labelText: label,
            labelStyle: TextStyle(
                color: errorText != null
                    ? Colors.red
                    : Theme.of(context).primaryColor,
                fontSize: 12),
            border: border
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff838383)),
                  )
                : UnderlineInputBorder(),
            focusedBorder: border
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff838383)),
                  )
                : UnderlineInputBorder(),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            isDense: true),
      ),
    );
  }
}
