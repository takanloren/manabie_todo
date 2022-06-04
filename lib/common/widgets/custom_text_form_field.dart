import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final void Function(String) onTextChanged;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final bool isPasswordField;
  final bool autoFocus;
  final TextEditingController? controller;
  final TextStyle? labelStyle;
  final bool isEnabled;
  final Widget? prefix;
  final InputDecoration? inputDecoration;
  final TextStyle? style;
  final int maxLines;
  final Key? key;

  CustomTextFormField(
      {required this.onTextChanged,
        this.label = '',
        this.hint = '',
        this.keyboardType = TextInputType.visiblePassword, // To disable suggestion bar
        this.isPasswordField = false,
        this.autoFocus = false,
        this.controller,
        this.labelStyle,
        this.prefix,
        this.style,
        this.isEnabled = true,
        this.inputDecoration,
        this.maxLines = 1,
        this.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      key: key,
      maxLines: maxLines,
      controller: controller,
      obscureText: isPasswordField,
      keyboardType: keyboardType,
      style: style ?? theme.textTheme.bodyText1,
      enabled: isEnabled,
      autofocus: autoFocus,
      decoration: inputDecoration ?? InputDecoration(
        prefixIcon: prefix,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(vertical: 6),
        labelText: label,
        hintText: hint,
        labelStyle: labelStyle ??
            theme.textTheme.bodyText1?.copyWith(
              color: theme.primaryColor,
            ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.secondary),
        ),
      ),
      onChanged: onTextChanged,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
