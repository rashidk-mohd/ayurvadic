import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/core/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentOptionWidget extends StatelessWidget {
  const PaymentOptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Payment Option",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorConstents.textcolor),
        ),
        SizedBox(
          width: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              const List<String> items = Utils.paymentOptions;
              return  Expanded(
                child: RadioListTile(
                      title: Text(items[index]),
                      value: 'Option 1',
                      groupValue: 'Option 1',
                      onChanged: (value) {},
                    ),
              );
            },
          ),
        )
      ],
    );
  }
}
