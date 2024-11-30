import 'package:ayurvadic/contants/color_constents.dart';
import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  final String title;
  final String? header;
  final List<String> items;
  final String? selectedItem;
  final String Function(String)? itemAsString;
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onChanged;
  final Widget? iconWidget;
  final Widget? suffixWidget;
  final Color? borderColor;
  final bool isAutovalidate;
  final double? borderRadius;

  const CustomDropdownField({
    super.key,
    required this.title,
    required this.header,
    required this.items,
    this.selectedItem,
    this.itemAsString,
    this.validator,
    this.onChanged,
    this.iconWidget,
    this.suffixWidget,
    this.borderColor,
    this.isAutovalidate = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header!.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  header!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorConstents.textcolor,
                      ),
                ),
              ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: selectedItem,
          validator: validator,
          autovalidateMode: isAutovalidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          onChanged: onChanged,
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(itemAsString != null
                        ? itemAsString!(item)
                        : item.toString()),
                  ))
              .toList(),
          decoration: InputDecoration(
            hintText: title,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xff8892A1),
                  fontSize: 15,
                ),
            prefixIcon: iconWidget,
            suffixIcon: suffixWidget,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff8892A1)),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff8892A1)),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff8892A1)),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
        ),
      ],
    );
  }
}
