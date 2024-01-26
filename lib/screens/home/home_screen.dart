import 'package:certificateapp/controllers/auth/signup_controller.dart';
import 'package:certificateapp/controllers/home/home_controller.dart';
import 'package:certificateapp/globals/widgets/custom_appbar.dart';
import 'package:certificateapp/globals/widgets/custom_button.dart';
import 'package:certificateapp/globals/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:certificateapp/controllers/auth/login_controller.dart';
import 'package:certificateapp/utils/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = HomeController();

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
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: Column(
              children: [
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
              ],
            ),
          )),
        ));
  }
}
