import 'package:ayurvadic/common/botton_widget.dart';
import 'package:ayurvadic/common/common_textfield.dart';
import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/contants/path_constsnts.dart';
import 'package:ayurvadic/core/app_responsive.dart';
import 'package:ayurvadic/features/registration/widgets/couple_count_box__widget.dart';
import 'package:ayurvadic/features/registration/widgets/couple_count_widget.dart';
import 'package:ayurvadic/features/registration/widgets/payment_option_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            PathConstsnts.backarrow,
            height: 24,
            width: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              PathConstsnts.notificationicon,
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Text(
              "Registration",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorConstents.textcolor2),
            ),
            const CustomTextField(title: "Enter your fullname", header: "Name"),
            const CustomTextField(
                title: "Enter your whatsapp number", header: "Whatsapp number"),
            const CustomTextField(
                title: "Enter your full address", header: "Address"),
            const CustomTextField(
              title: "Select your location",
              header: "Location",
              suffixWidget: Icon(CupertinoIcons.chevron_down),
            ),
            const CustomTextField(
              title: "Select your Branch",
              header: "Branch",
              suffixWidget: Icon(CupertinoIcons.chevron_down),
            ),
            const SizedBox(
              height: 20,
            ),
            const CoupleCountWidget(),
            const SizedBox(
              height: 10,
            ),
            ButtonWidget(
              title: "+ Add Treatment",
              onPressed: () {},
              buttonColor: ColorConstents.colorGrey,
            ),
            const CustomTextField(
                title: "Enter your Amount", header: "Total Amount"),
            const CustomTextField(
                title: "Enter your Amount", header: "Discount Amount"),
            const CustomTextField(
                title: "Enter your Amount", header: "Advance Amount"),
            const CustomTextField(
                title: "Enter your Amount", header: "Balance Amount "),
            CustomTextField(
              title: "Enter your Amount",
              header: "Treatment Date",
              suffixWidget: Image.asset(PathConstsnts.treatmentCalender),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Treatment Time",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorConstents.textcolor),
            ),
            const Row(
              children: [
                Expanded(
                  child: CustomTextField(
                      title: "Houre",
                      header: "",
                      suffixWidget: Icon(
                        CupertinoIcons.chevron_down,
                        color: ColorConstents.buttonColor,
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: CustomTextField(
                        title: "Minute",
                        header: "",
                        suffixWidget: Icon(CupertinoIcons.chevron_down,
                            color: ColorConstents.buttonColor)))
              ],
            )
            // PaymentOptionWidget()
          ],
        ),
      ),
    );
  }
}
