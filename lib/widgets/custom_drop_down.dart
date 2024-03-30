import 'package:flutter/material.dart';

import '../models/selection_popup_model.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.alignment,
    this.width,
    this.focusNode,
    this.icon,
    this.autofocus = true,
    this.textStyle,
    this.items,
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
    this.onChanged,
  });

  final Alignment? alignment;
  final double? width;
  final FocusNode? focusNode;
  final Widget? icon;
  final bool? autofocus;
  final TextStyle? textStyle;
  final List<SelectionPopupModel>? items;
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
  final FormFieldValidator<SelectionPopupModel>? validator;
  final Function(SelectionPopupModel)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: dropDownWidget,
          )
        : dropDownWidget;
  }

  Widget get dropDownWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: DropdownButtonFormField<SelectionPopupModel>(
          focusNode: focusNode ?? FocusNode(),
          icon: icon,
          autofocus: autofocus!,
          style: textStyle ?? defaultTextStyle,
          items: items?.map((SelectionPopupModel item) {
            return DropdownMenuItem<SelectionPopupModel>(
              value: item,
              child: Text(
                item.title,
                overflow: TextOverflow.ellipsis,
                style: hintStyle ?? defaultTextStyle,
              ),
            );
          }).toList(),
          decoration: decoration,
          validator: validator,
          onChanged: (value) {
            onChanged!(value!);
          },
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? defaultTextStyle,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? const EdgeInsets.all(11),
        fillColor: fillColor ?? const Color(0xFF5C6BC0),
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
      );

  TextStyle get defaultTextStyle => const TextStyle(
        color: Color(0XFF000000),
        fontSize: 14,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      );
}
