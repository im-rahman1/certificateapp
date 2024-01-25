import 'package:certificateapp/controllers/auth/signup_controller.dart';
import 'package:certificateapp/globals/adaptive_helper.dart';
import 'package:certificateapp/globals/widgets/custom_button.dart';
import 'package:certificateapp/globals/widgets/custom_text_fields.dart';
import 'package:certificateapp/screens/auth/login_screen.dart';
import 'package:certificateapp/utils/app_colors.dart';
import 'package:certificateapp/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      // appBar: AppBar(backgroundColor: AppColors.primaryColor),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: wd(30), vertical: ht(15)),
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 80, bottom: 30),
                child: Image.asset(
                  'assets/logo_primary.png',
                  width: wd(230),
                ),
              ),
            ),
            SizedBox(
              height: ht(20),
            ),
            Text(
              'Forgot password?',
              textAlign: TextAlign.center,
              style: headingText(color: Colors.black, size: 26),
            ),
            SizedBox(
              height: ht(20),
            ),
            Text(
              'Enter your email to reset password',
              textAlign: TextAlign.center,
              style: normalText(color: Colors.black, size: 14),
            ),
            SizedBox(
              height: ht(34),
            ),
            GetBuilder<SignUpController>(builder: (value) {
              return Column(
                children: [
                  _userSignUp(value),
                  SizedBox(
                    height: ht(20),
                  ),
                  CustomButton(
                    color: AppColors.primaryColor,
                    label: 'Submit',
                    onPress: () {
                      controller.resetPassowrd();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("or"),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: BorderedButton(
                        label: 'Login',
                        buttonHight: ht(55),
                        elevation: 0,
                        onPress: () {
                          Get.offAll(const Login());
                        },
                      )),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _userSignUp(SignUpController value) {
    return Column(
      children: [
        customTextFiled(
            controller.emailController,
            prefix: Icon(
              Icons.email,
              color: AppColors.colorGray.withOpacity(0.5),
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            controller.emailFocusNode,
            hint: "Enter your email")
      ],
    );
  }
}
