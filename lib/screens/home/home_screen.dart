import 'package:certificateapp/controllers/home/home_controller.dart';
import 'package:certificateapp/globals/widgets/custom_appbar.dart';
import 'package:certificateapp/globals/widgets/custom_checkbox.dart';
import 'package:certificateapp/globals/widgets/custom_text_fields.dart';
import 'package:certificateapp/utils/app_colors.dart';
import 'package:certificateapp/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: customAppBar(
            "Certificate",
            color: AppColors.primaryColor,
            leading: false,
            // action: ,
          ),
          backgroundColor: AppColors.colorWhite,
          body: SafeArea(child: GetBuilder<HomeController>(builder: (logic) {
            return Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Personal Details",
                          style: subHeadingText(),
                          textDirection: TextDirection.ltr),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "Certificate Id",
                        controller.certificateIdController,
                        controller.certificateIdFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "Location Details",
                        controller.locationDetailsController,
                        controller.locationDetailsFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "Contact Details",
                        hint: 'Enter Phone and Address',
                        controller.contactDetailsController,
                        controller.contactDetailsFocusNode),
                    const SizedBox(
                        height: 20,
                        child: Divider(
                          height: 1,
                          color: AppColors.scaffoldBacground,
                        )),
                    customTextFiled(
                        label: "Worker Name",
                        hint: 'Enter Name of worker',
                        controller.nameOfWorkerController,
                        controller.nameOfWorkerFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "License no.",
                        hint: 'Enter license number of worker',
                        controller.licenseNumberController,
                        controller.licenseNumberFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "Email / Phone",
                        hint: 'Enter email or phone no. of worker',
                        controller.licenseNumberController,
                        controller.licenseNumberFocusNode),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFiled(
                        label: "Supervisor Name",
                        // hint: 'Enter email or phone no. of worker',
                        controller.nameOfSupervisorController,
                        controller.nameOfSupervisorFocusNode),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("CoC",
                          style: subHeadingText(),
                          textDirection: TextDirection.ltr),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Type of work"),
                    CustomCheckBox(
                        value: logic.typeOfWork['addition'] as bool,
                        onChange: (val) {
                          print(val);
                          logic.typeOfWork['addition'] = val as bool;
                          logic.update();
                        },
                        label: "label")
                  ],
                ));
          })),
        ));
  }
}
