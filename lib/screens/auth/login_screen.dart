import 'package:certificateapp/controllers/auth/login_controller.dart';
import 'package:certificateapp/globals/adaptive_helper.dart';
import 'package:certificateapp/globals/widgets/custom_button.dart';
import 'package:certificateapp/globals/widgets/custom_checkbox.dart';
import 'package:certificateapp/globals/widgets/custom_text_fields.dart';
import 'package:certificateapp/screens/auth/forgotPassword_screen.dart';
import 'package:certificateapp/screens/auth/signup_screen.dart';
import 'package:certificateapp/utils/app_colors.dart';
import 'package:certificateapp/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.colorWhite,
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 80, bottom: 30),
                          child: Image.asset(
                            'assets/logo_primary.png',
                            width: wd(230),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 30),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Login",
                                    style: headingText(
                                        color: AppColors.colorBlack, size: 28)),
                                const Text(
                                  "Enter you email and password",
                                )
                              ],
                            ),
                          ),
                        ),
                        customTextFiled(
                            controller.emailController,
                            prefix: Icon(
                              Icons.email,
                              color: AppColors.colorGray.withOpacity(0.5),
                              size: 24.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                            controller.emailNode, onTap: () {
                          // controller.getSaved();
                        },
                            textInputType: TextInputType.emailAddress,
                            hint: 'Email'),
                        const SizedBox(
                          height: 15,
                        ),
                        GetBuilder<LoginController>(
                            id: 'pass',
                            builder: (logic) {
                              return customTextFiled(
                                  controller.passwordController,
                                  controller.passNode,
                                  prefix: Icon(
                                    Icons.lock,
                                    color: AppColors.colorGray.withOpacity(0.5),
                                    size: 24.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                  suffix: GestureDetector(
                                    onTap: () => logic.updateHidePassword(),
                                    child: Icon(
                                      logic.hidePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color:
                                          AppColors.colorGray.withOpacity(0.5),
                                      size: 24.0,
                                      semanticLabel:
                                          'Text to announce in accessibility modes',
                                    ),
                                  ),
                                  hint: 'Password',
                                  obscure: logic.hidePassword,
                                  isPassword: true);
                            }),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Row(
                            //   children: [
                            //     CustomCheckbox(
                            //         initialValue: false, onChanged: (v) {}),
                            //     SizedBox(
                            //       child: Text(
                            //         "Remember me",
                            //         style: regularText(size: 13),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              onTap: () {
                                Get.to(() => ForgetPassword());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  'Forgot Password',
                                  style: headingText(size: 13)
                                      .copyWith(color: AppColors.colorGray),
                                ),
                              ),
                            )
                          ],
                        ),
                        GetBuilder<LoginController>(builder: (logic) {
                          return SizedBox(
                              width: double.infinity,
                              child: CustomButton(
                                enable: controller.loading != 'logging'
                                    ? true
                                    : false,
                                label: 'Login',
                                color: controller.loading != 'logging'
                                    ? AppColors.primaryColor
                                    : Colors.grey,
                                onPress: () {
                                  controller.login();
                                },
                              ));
                        }),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Don't have an account!"),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: BorderedButton(
                              label: 'Create an Account',
                              buttonHight: ht(55),
                              elevation: 0,
                              onPress: () {
                                Get.to(const Signup());
                              },
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
