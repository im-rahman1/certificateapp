import 'package:certificateapp/controllers/auth/login_controller.dart';
import 'package:certificateapp/controllers/auth/signup_controller.dart';
import 'package:certificateapp/globals/adaptive_helper.dart';
import 'package:certificateapp/globals/widgets/custom_button.dart';
import 'package:certificateapp/globals/widgets/custom_checkbox.dart';
import 'package:certificateapp/globals/widgets/custom_text_fields.dart';
import 'package:certificateapp/screens/home/home_screen.dart';
import 'package:certificateapp/utils/app_colors.dart';
import 'package:certificateapp/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var controller = Get.put(SignUpController());

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
                          margin: const EdgeInsets.only(top: 30, bottom: 30),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Create Account",
                                    style: headingText(
                                        color: AppColors.colorBlack, size: 28)),
                                const Text(
                                  "Complete form below to continue",
                                )
                              ],
                            ),
                          ),
                        ),
                        customTextFiled(controller.firstNameController,
                            controller.firstNameFocusNode,
                            prefix: Icon(
                              Icons.person,
                              color: AppColors.colorGray.withOpacity(0.5),
                              size: 24.0,
                              semanticLabel: 'Person icon',
                            ), onTap: () {
                          // controller.getSaved();
                        },
                            textInputType: TextInputType.emailAddress,
                            hint: 'First Name'),
                        const SizedBox(
                          height: 15,
                        ),
                        customTextFiled(controller.lastNameController,
                            controller.lastNameFocusNode,
                            prefix: Icon(
                              Icons.person,
                              color: AppColors.colorGray.withOpacity(0.5),
                              size: 24.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ), onTap: () {
                          // controller.getSaved();
                        },
                            textInputType: TextInputType.emailAddress,
                            hint: 'Last Name'),
                        const SizedBox(
                          height: 15,
                        ),
                        customTextFiled(controller.emailController,
                            controller.emailFocusNode,
                            prefix: Icon(
                              Icons.email,
                              color: AppColors.colorGray.withOpacity(0.5),
                              size: 24.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ), onTap: () {
                          // controller.getSaved();
                        },
                            textInputType: TextInputType.emailAddress,
                            hint: 'Email'),
                        const SizedBox(
                          height: 15,
                        ),
                        GetBuilder<SignUpController>(
                            id: 'pass1',
                            builder: (logic) {
                              return customTextFiled(
                                  controller.passwordController,
                                  controller.passwordFocusNode,
                                  prefix: Icon(
                                    Icons.lock,
                                    color: AppColors.colorGray.withOpacity(0.5),
                                    size: 24.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                  suffix: GestureDetector(
                                    onTap: () => logic.updateHidePassword1(),
                                    child: Icon(
                                      logic.obscure1
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color:
                                          AppColors.colorGray.withOpacity(0.5),
                                      size: 24.0,
                                      semanticLabel:
                                          'Text to announce in accessibility modes',
                                    ),
                                  ),
                                  hint: 'Enter Password',
                                  obscure: logic.obscure1,
                                  isPassword: true);
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        GetBuilder<SignUpController>(
                            id: 'pass2',
                            builder: (logic) {
                              return customTextFiled(
                                  controller.confirmPasswordController,
                                  controller.confirmPasswordFocusNode,
                                  prefix: Icon(
                                    Icons.lock,
                                    color: AppColors.colorGray.withOpacity(0.5),
                                    size: 24.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                  suffix: GestureDetector(
                                    onTap: () => {logic.updateHidePassword2()},
                                    child: Icon(
                                      logic.obscure1
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color:
                                          AppColors.colorGray.withOpacity(0.5),
                                      size: 24.0,
                                      semanticLabel:
                                          'Text to announce in accessibility modes',
                                    ),
                                  ),
                                  hint: 'Re-Enter Password',
                                  obscure: logic.obscure2,
                                  isPassword: true);
                            }),
                        const SizedBox(
                          height: 5,
                        ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     CustomCheckbox(
                        //         initialValue: false, onChanged: (v) {}),
                        //     SizedBox(
                        //       child: Text(
                        //         "Accept terms & conditions",
                        //         style: regularText(size: 13),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.changeTerms();
                          },
                          child: Row(
                            children: [
                              GetBuilder<SignUpController>(builder: (value) {
                                return Container(
                                  margin: const EdgeInsets.only(left: 3),
                                  height: 20,
                                  width: 20,
                                  child: CustomCheckbox(
                                      initialValue: value.terms,
                                      label: 'Accept terms & conditions',
                                      onChanged: (check) =>
                                          controller.changeTerms()),
                                );
                              }),
                              Expanded(
                                child: Text(
                                  '  Accept terms & conditions',
                                  style: normalText(
                                      size: 13, color: AppColors.borderColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GetBuilder<LoginController>(
                            id: 'signupButton',
                            builder: (logic) {
                              return SizedBox(
                                  width: double.infinity,
                                  child: CustomButton(
                                    label: 'Signup',
                                    color: controller.loading != 'signup'
                                        ? AppColors.primaryColor
                                        : Colors.grey,
                                    onPress: () async {
                                      await controller.createUser();
                                    },
                                  ));
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Already have an account!"),
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
                                Get.back();
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
