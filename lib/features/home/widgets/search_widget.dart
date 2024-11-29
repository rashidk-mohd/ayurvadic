import 'package:ayurvadic/common/botton_widget.dart';
import 'package:ayurvadic/common/common_textfield.dart';
import 'package:ayurvadic/contants/color_constents.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 3,
          child: CustomTextField(
            iconWidget:Icon(Icons.search) ,
            title: "Search for treatment",
          ),
        ),
        const SizedBox(width: 10),
        ButtonWidget(
          buttonHeigth: 40, // Adjust height
          buttonWidth: 100, // Adjust width
          buttonColor: ColorConstents.buttonColor,
          title: "Search",
          onPressed: () {},
        ),
      ],
    );
  }
}
