import 'dart:developer';
import 'dart:io';

import 'package:ayurvadic/common/botton_widget.dart';
import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/contants/path_constsnts.dart';
import 'package:ayurvadic/contants/routes_const.dart';
import 'package:ayurvadic/core/utils.dart';
import 'package:ayurvadic/features/home/controllers/home_controller.dart';
import 'package:ayurvadic/features/home/models/patientList_model.dart';
import 'package:ayurvadic/features/home/widgets/home_content_card.dart';
import 'package:ayurvadic/features/home/widgets/pdf_widget.dart';
import 'package:ayurvadic/features/home/widgets/search_widget.dart';
import 'package:ayurvadic/features/home/widgets/sorting_widget.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    Provider.of<HomeController>(context, listen: false).getPatientList();

    super.initState();
  }

  Future<void> _refresh() async {
    Provider.of<HomeController>(context, listen: false).getPatientList();
  }
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return RefreshIndicator(
      onRefresh: _refresh  ,
      child: Scaffold(
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
        body: homeController.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
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
                        itemCount: homeController.filteredItems.length,
                        itemBuilder: (context, index) {
                          final patientList = homeController.filteredItems[index];
                          return HomeContentCard(
                            index: index,
                            patient: patientList,
                            adress: patientList.address,
                            branch: patientList.branch?.name ?? "",
                            email: patientList.branch?.mail ?? "",
                            gst: patientList.branch?.gst ?? "",
                            phone: patientList.phone,
                            name: patientList.name,
                            time: patientList.dateNdTime == null
                                ? ""
                                : Utils.converDateFormate(
                                    patientList.dateNdTime.toString()),
                            tretmentName:
                                patientList.patientdetailsSet![0].treatmentName,
                            date: patientList.dateNdTime == null
                                ? ""
                                : Utils.converDateFormate(
                                    patientList.dateNdTime.toString()),
                            user: patientList.user,
                          );
                        },
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
      ),
    );
  }
}
