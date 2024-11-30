import 'dart:developer';

import 'package:ayurvadic/common/botton_widget.dart';
import 'package:ayurvadic/common/common_textfield.dart';
import 'package:ayurvadic/common/dropdown_text_field.dart';
import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/contants/path_constsnts.dart';
import 'package:ayurvadic/core/app_responsive.dart';
import 'package:ayurvadic/core/local_storage.dart';
import 'package:ayurvadic/core/utils.dart';
import 'package:ayurvadic/features/home/models/patientList_model.dart';
import 'package:ayurvadic/features/home/widgets/pdf.dart';
import 'package:ayurvadic/features/registration/controller/reg_controller.dart';
import 'package:ayurvadic/features/registration/models/reg_model.dart';
import 'package:ayurvadic/features/registration/repository/reg_repository.dart';
import 'package:ayurvadic/features/registration/widgets/couple_count_box__widget.dart';
import 'package:ayurvadic/features/registration/widgets/couple_count_widget.dart';
import 'package:ayurvadic/features/registration/widgets/gender_count_widget.dart';
import 'package:ayurvadic/features/registration/widgets/payment_option_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void initState() {
    Provider.of<RegController>(context, listen: false).getdropDownLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regController = Provider.of<RegController>(context);
    log("${regController.branches}");
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
      body: regController.getIsLoding
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
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
                  CustomTextField(
                    title: "Enter your fullname",
                    header: "Name",
                    controller: regController.fullnameController,
                  ),
                  CustomTextField(
                    title: "Enter your whatsapp number",
                    header: "Whatsapp number",
                    controller: regController.wnumberController,
                  ),
                  CustomTextField(
                    title: "Enter your full address",
                    header: "Address",
                    controller: regController.addresController,
                  ),
                  CustomDropdownField(
                    items: regController.branches,
                    onChanged: (p0) {},
                    title: "Select your location",
                    header: "Location",
                    suffixWidget: Icon(CupertinoIcons.chevron_down),
                  ),
                  CustomDropdownField(
                    items: regController.branches,
                    onChanged: (value) {
                      regController.selectedBranch(value!);
                    },
                    title: "Select your Branch",
                    selectedItem: regController.selectedbranch,
                    header: "Branch",
                    suffixWidget: const Icon(CupertinoIcons.chevron_down),
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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: CustomDropdownField(
                                    title: "Choose treatment",
                                    header: "Choose Preferred Treatment",
                                    items: regController.treatments,
                                    onChanged: (value) {},
                                  ),
                                ),
                                GenderCountWidgetPopUp(
                                  gender: "Male",
                                  onTapPlus: () {
                                    regController.maleAdd();
                                  },
                                  ontapMinus: () {
                                    regController.maleMinus();
                                  },
                                  count: regController.malecount,
                                ),
                                GenderCountWidgetPopUp(
                                  gender: "Female",
                                  onTapPlus: () {
                                    regController.femaleAdd();
                                  },
                                  ontapMinus: () {
                                    regController.femaleMinus();
                                  },
                                  count: regController.femaleCount,
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                    },
                    buttonColor: ColorConstents.colorGrey,
                  ),
                  Text(
                    "Payment Option",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorConstents.textcolor),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Utils.paymentOptions.length,
                      itemBuilder: (context, index) => RadioMenuButton(
                          value: Utils.paymentOptions[index],
                          groupValue: regController.paymentSelectedOption,
                          onChanged: (value) {
                            regController.payMentOption(value!);
                          },
                          child: Text(Utils.paymentOptions[index])),
                    ),
                  ),
                  CustomTextField(
                    title: "Enter your Amount",
                    header: "Total Amount",
                    controller: regController.totalAmountController,
                  ),
                  CustomTextField(
                    title: "Enter your Amount",
                    header: "Discount Amount",
                    controller: regController.discountamoutcontroller,
                  ),
                  CustomTextField(
                    title: "Enter your Amount",
                    header: "Advance Amount",
                    controller: regController.discountamoutcontroller,
                  ),
                  CustomTextField(
                    title: "Enter your Amount",
                    header: "Balance Amount ",
                    controller: regController.balancAmountController,
                  ),
                  CustomTextField(
                    title: "Enter your date",
                    header: "Treatment Date",
                    controller: TextEditingController(
                        text: regController.selectedDateFormatted),
                    suffixWidget: InkWell(
                        onTap: () {
                          regController.selectDate(context);
                        },
                        child: Image.asset(PathConstsnts.treatmentCalender)),
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
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropdownField(
                            items: regController.hours,
                            title: "Houre",
                            header: "",
                            suffixWidget: const Icon(
                              CupertinoIcons.chevron_down,
                              color: ColorConstents.buttonColor,
                            )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: CustomDropdownField(
                              items: Utils.minutes,
                              title: "Minute",
                              header: "",
                              suffixWidget: const Icon(
                                  CupertinoIcons.chevron_down,
                                  color: ColorConstents.buttonColor))),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    title: "Save",
                    buttonColor: ColorConstents.buttonColor,
                    onPressed: () async {
                      String? mail = await LocalStorage.readMail();
                      String? phone = await LocalStorage.readPhone();
                      await regController.postRegistration(
                          context,
                          RegModel(
                              name: regController.fullnameController.text,
                              executive: "",
                              payment: regController.paymentSelectedOption ??
                                  "",
                              phone: regController.wnumberController.text,
                              address: regController.addresController.text,
                              totalAmount: double.tryParse(regController
                                      .totalAmountController.text) ??
                                  0.0,
                              discountAmount: double.tryParse(regController
                                      .discountamoutcontroller.text) ??
                                  0.0,
                              advanceAmount: double.tryParse(regController
                                      .advanceAmountController.text) ??
                                  0.0,
                              balanceAmount: double.tryParse(
                                      regController.balancAmountController.text) ??
                                  0.0,
                              dateAndTime: regController.selectedDateFormatted ?? "",
                              male: [],
                              female: [],
                              branch: regController.selectedbranch ?? "",
                              treatments: []));
                      generatePDF(
                        address: regController.addresController.text,
                        name: regController.fullnameController.text,
                        branch: regController.selectedbranch,
                        date: regController.selectedDateFormatted ?? "",
                        time: regController.selectedDateFormatted ?? "",
                        email: mail,
                        phone: phone,
                        gst: "",
                        booked:
                            "${Utils.converDateFormateForReg(DateTime.now().toString())}| ${DateFormat('hh:mm a').format(DateTime.now())}",
                        patient: Patient(),
                      );
                    },
                    borderColor: ColorConstents.buttonColor,
                  )
                ],
              ),
            ),
    );
  }
}
