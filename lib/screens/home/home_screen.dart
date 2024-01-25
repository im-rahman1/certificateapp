import 'package:certificateapp/controllers/auth/signup_controller.dart';
import 'package:certificateapp/globals/widgets/custom_button.dart';
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
  var signupcontroller = Get.put(SignUpController());
  var logincontroller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.colorWhite,
          body: SafeArea(
              child: Column(
            children: [
              Text("Home Page"),
              CustomButton(
                  label: "Logout",
                  color: AppColors.primaryColor,
                  onPress: () {
                    logincontroller.logout();
                  })
            ],
          )),
        ));
  }
}
