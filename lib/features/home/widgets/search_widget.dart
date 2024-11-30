import 'package:ayurvadic/common/botton_widget.dart';
import 'package:ayurvadic/common/common_textfield.dart';
import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: CustomTextField(
            onChanged: (p0) {
              homeController.filterItems(p0);
            },
            header: "",
            iconWidget: const Icon(Icons.search),
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
