import 'package:ayurvadic/common/common_textfield.dart';
import 'package:ayurvadic/contants/color_constents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortingWidget extends StatelessWidget {
  const SortingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(
            width: 160,
            child: CustomTextField(
              header: "",
              borderRadius: 30,
              title: "Date",
              suffixWidget: Icon(CupertinoIcons.chevron_down),
            ),
          )
        ],
      ),
    );
  }
}