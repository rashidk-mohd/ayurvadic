import 'package:ayurvadic/common/common_textfield.dart';
import 'package:ayurvadic/common/dropdown_text_field.dart';
import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/core/utils.dart';
import 'package:ayurvadic/features/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortingWidget extends StatelessWidget {
  const SortingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sort by :",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorConstents.textcolor2),
          ),
          SizedBox(
            width: 160,
            child: InkWell(
              onTap: () {
                homeController.sortListByDate(context);
              },
              child: CustomTextField(
                controller: TextEditingController(
                    text: homeController.selectedDateFormatted ?? ""),
                enable: false,
                header: "",
                borderRadius: 30,
                title: "Date",
                suffixWidget: const Icon(CupertinoIcons.chevron_down),
              ),
            ),
          )
        ],
      ),
    );
  }
}
