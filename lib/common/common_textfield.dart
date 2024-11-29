import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final Widget? iconWidget;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool isObscured;
  final TextInputType? keyboardType;
  final Color? borderColor;
  final bool isAutovalidate;
  final bool digitOnly;
  final bool fillcolor;
  final int? lines;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.title,
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        TextFormField(
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
            fillColor:
                 Colors.grey ,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(0xff8892A1),
                  fontSize: 15,
                ),
            suffixIcon: iconWidget,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff8892A1),
                ),
                borderRadius: BorderRadius.circular(8)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff8892A1),
                ),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff8892A1),
                ),
                borderRadius: BorderRadius.circular(8)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
