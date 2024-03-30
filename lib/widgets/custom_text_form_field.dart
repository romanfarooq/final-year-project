import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
  });

  final Alignment? alignment;
  final double? width;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(10), // Adjust border radius as needed
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 4, // Blur radius
            offset: const Offset(0, 1), // Offset in x and y directions
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: false,
        style: textStyle ?? const TextStyle(color: Color(0XFFA8AEB8)),
        obscureText: obscureText!,
        textInputAction: textInputAction!,
        keyboardType: textInputType!,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          hintText: hintText ?? "",
          prefixIcon: prefix,
          prefixIconConstraints: prefixConstraints,
          suffix: suffix,
          suffixIconConstraints: suffixConstraints,
          isDense: true,
          contentPadding: const EdgeInsets.only(
            top: 20,
            right: 20,
            bottom: 20,
          ),
          fillColor: fillColor ?? const Color.fromARGB(255, 255, 255, 255),
          filled: filled,
          border: borderDecoration ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
          enabledBorder: borderDecoration ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
          focusedBorder: borderDecoration ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
        ),
        validator: validator,
      ),
    );
  }
}
