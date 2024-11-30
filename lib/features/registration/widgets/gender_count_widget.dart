import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/features/registration/controller/reg_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderCountWidgetPopUp extends StatelessWidget {
  const GenderCountWidgetPopUp(
      {super.key,
      required this.gender,
      required this.onTapPlus,
      required this.ontapMinus,
      required this.count});
  final String? gender;
  final void Function()? ontapMinus;
  final void Function()? onTapPlus;
  final int count;
  @override
  Widget build(BuildContext context) {
    final regController = Provider.of<RegController>(context);
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 20,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Center(child: Text(gender!)),
          ),
        ),
        Expanded(
            child: InkWell(
          onTap: onTapPlus,
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstents.buttonColor,
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        )),
        Expanded(
          child: Container(
            width: 20,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Center(child: Text("$count")),
          ),
        ),
        Expanded(
            child: InkWell(
          onTap: ontapMinus,
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstents.buttonColor,
            ),
            child: const Center(child:  Icon(Icons.remove, color: Colors.white)),
          ),
        ))
      ],
    );
  }
}
