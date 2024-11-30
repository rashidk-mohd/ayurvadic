import 'package:ayurvadic/contants/color_constents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final Widget? iconWidget;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool isObscured;
  final TextInputType? keyboardType;
  final Color? borderColor;
  final bool isAutovalidate;
  final bool digitOnly;
  final bool fillcolor;
  final int? lines;
  final double? borderRadius;
  final void Function(String)? onChanged;
  final String? header;
  final bool? enable;

  const CustomTextField({
    super.key,
    required this.title,
    required this.header,
    this.hintText = "",
    this.iconWidget,
    this.controller,
    this.validator,
    this.isObscured = false,
    this.keyboardType = TextInputType.text,
    this.borderColor,
    this.isAutovalidate = false,
    this.digitOnly = false,
    this.fillcolor = false,
    this.lines,
    this.onChanged,
    this.suffixWidget,
    this.borderRadius,
    this.enable
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      header!.isEmpty?const SizedBox():  Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
            header!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorConstents.textcolor),
          ),
      ),
        const SizedBox(height: 10,),
        TextFormField(
          enabled: enable??true,
          maxLines: lines,
          inputFormatters:
              digitOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
          autovalidateMode: isAutovalidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          obscureText: isObscured,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: title,
            fillColor: Colors.grey,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(0xff8892A1),
                  fontSize: 15,
                ),
            prefixIcon: iconWidget,
            suffixIcon: suffixWidget,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff8892A1),
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 8)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff8892A1),
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 8)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff8892A1),
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 8)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(borderRadius ?? 8)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
        ),
      ],
    );
  }
}
