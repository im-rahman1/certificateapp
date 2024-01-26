import 'dart:developer';

import 'package:certificateapp/globals/database.dart';
import 'package:certificateapp/globals/enum.dart';
import 'package:certificateapp/globals/global.dart';
import 'package:certificateapp/models/user.dart';
import 'package:certificateapp/screens/home/home_screen.dart';
import 'package:certificateapp/utils/login_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool hidePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passNode = FocusNode();
  String loading = "";

  TextEditingController certificateIdController = TextEditingController();
  TextEditingController locationDetailsController = TextEditingController();
  TextEditingController contactDetailsController = TextEditingController();
  TextEditingController nameOfWorkerController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController phoneEmailController = TextEditingController();
  TextEditingController nameOfSupervisorController = TextEditingController();

  FocusNode certificateIdFocusNode = FocusNode();
  FocusNode locationDetailsFocusNode = FocusNode();
  FocusNode contactDetailsFocusNode = FocusNode();
  FocusNode nameOfWorkerFocusNode = FocusNode();
  FocusNode licenseNumberFocusNode = FocusNode();
  FocusNode companyNameFocusNode = FocusNode();
  FocusNode phoneEmailFocusNode = FocusNode();
  FocusNode nameOfSupervisorFocusNode = FocusNode();

  Future<bool> initvalidation() async {
    if (!Global.checkNull(emailController.text.toString().trim())) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "",
          strMsg: 'Please enter email',
          toastType: TOAST_TYPE.toastError);
      FocusScope.of(Get.overlayContext!).requestFocus(emailNode);
      return false;
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text.toString().trim())) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "",
          strMsg: 'Please enter a valid email',
          toastType: TOAST_TYPE.toastError);
      FocusScope.of(Get.overlayContext!).requestFocus(emailNode);
      return false;
    }
    if (!(passwordController.text.length > 7)) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "ok",
          strMsg: 'Password must be at least 8 characters long',
          toastType: TOAST_TYPE.toastError);
      FocusScope.of(Get.overlayContext!).requestFocus(passNode);
      return false;
    }
    // if (await Database.isUserExist(emailController.text.toString().trim())) {
    //   EasyLoading.dismiss();
    //   Global.showToastAlert(
    //       context: Get.overlayContext!,
    //       strTitle: "ok",
    //       strMsg: 'An account with this email already exists.',
    //       toastType: TOAST_TYPE.toastError);
    //   return false;
    // }
    return true;
  }

  Future<void> submitForm() async {
    if (await (initvalidation())) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "ok",
          strMsg: 'Validation error',
          toastType: TOAST_TYPE.toastError);
    }
  }

  updateHidePassword() {
    hidePassword = !hidePassword;
    update(['pass']);
  }
}
