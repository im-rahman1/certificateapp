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

class LoginController extends GetxController {
  bool hidePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passNode = FocusNode();
  String loading = "";

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

  forgetPassword() async {
    if (!await (initvalidation())) return;
    try {} catch (e) {}

    // Get.to(() => const NavBarScreen());
  }

  Future<void> login() async {
    try {
      if (!await (initvalidation())) return;
      EasyLoading.show();
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text);
      log(userCredential.user.toString());
      if (userCredential.user != null) {
        var user = await Database.getUser(userCredential.user!.uid);
        if (user == null) {
          EasyLoading.dismiss();
          return;
        }

        await Get.find<UserDetail>().setData(user.toMap());
        await Get.find<UserDetail>().getData();

        Get.offAll(Home());

        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        Global.showToastAlert(
            context: Get.overlayContext!,
            strTitle: "ok",
            strMsg: 'Email or Password are incorrect. Please try again',
            toastType: TOAST_TYPE.toastError);
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        Global.showToastAlert(
            context: Get.overlayContext!,
            strTitle: "ok",
            strMsg: 'No user found with the provided email address',
            toastType: TOAST_TYPE.toastError);
      } else if (e.code == 'wrong-password') {
        Global.showToastAlert(
            context: Get.overlayContext!,
            strTitle: "ok",
            strMsg: 'Email or Password are incorrect. Please try again',
            toastType: TOAST_TYPE.toastError);
      } else {
        Global.showToastAlert(
            context: Get.overlayContext!,
            strTitle: "ok",
            strMsg: 'Email or Password are incorrect. Please try again',
            toastType: TOAST_TYPE.toastError);
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "ok",
          strMsg: 'Email or Password are incorrect. Please try again',
          toastType: TOAST_TYPE.toastError);
    }
  }

  updateHidePassword() {
    hidePassword = !hidePassword;
    update(['pass']);
  }

  Future<void> logout() async {
    Get.find<UserDetail>().logout();
  }
}
