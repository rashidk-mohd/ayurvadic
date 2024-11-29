import 'package:ayurvadic/common/botton_widget.dart';
import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/contants/path_constsnts.dart';
import 'package:ayurvadic/contants/routes_const.dart';
import 'package:ayurvadic/features/home/widgets/home_content_card.dart';
import 'package:ayurvadic/features/home/widgets/search_widget.dart';
import 'package:ayurvadic/features/home/widgets/sorting_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchWidget(),
            const SortingWidget(),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: ColorConstents.colorGrey.withOpacity(0.2),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const HomeContentCard(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonWidget(
          title: "Register Now",
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.registation);
          },
          buttonColor: ColorConstents.buttonColor,
        ),
      ),
    );
  }
}
