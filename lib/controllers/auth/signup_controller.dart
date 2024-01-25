import 'package:certificateapp/globals/database.dart';
import 'package:certificateapp/globals/enum.dart';
import 'package:certificateapp/globals/global.dart';
import 'package:certificateapp/models/user.dart';
import 'package:certificateapp/screens/home/home_screen.dart';
import 'package:certificateapp/utils/login_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  dynamic name;
  var loading = "";
  bool terms = false;
  bool obscure1 = true;
  bool obscure2 = true;

  updateHidePassword1() {
    obscure1 = !obscure1;
    update(['pass1']);
  }

  updateHidePassword2() {
    obscure2 = !obscure2;
    update(['pass2']);
  }

  changeTerms() {
    terms = !terms;
    update();
  }

  Future<bool> initvalidation() async {
    if (!Global.checkNull(firstNameController.text.toString().trim())) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "",
          strMsg: 'Please enter first name',
          toastType: TOAST_TYPE.toastError);
      FocusScope.of(Get.overlayContext!).requestFocus(firstNameFocusNode);
      return false;
    }
    if (!Global.checkNull(lastNameController.text.toString().trim())) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "",
          strMsg: 'Please enter last name',
          toastType: TOAST_TYPE.toastError);
      FocusScope.of(Get.overlayContext!).requestFocus(lastNameFocusNode);
      return false;
    }
    // if (!Global.checkNull(controllerPhone.text.toString().trim())) {
    //   Global.showToastAlert(
    //       context: Get.overlayContext!,
    //       strTitle: "",
    //       strMsg: 'Please enter phone number',
    //       toastType: TOAST_TYPE.toastError);
    //   FocusScope.of(Get.overlayContext!).requestFocus(focusNodePhone);
    //   return false;
    // }

    if (!Global.checkNull(emailController.text.toString().trim())) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "",
          strMsg: 'Please enter email',
          toastType: TOAST_TYPE.toastError);
      FocusScope.of(Get.overlayContext!).requestFocus(emailFocusNode);
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
      FocusScope.of(Get.overlayContext!).requestFocus(emailFocusNode);
      return false;
    }
    if (!(passwordController.text.length > 7)) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "ok",
          strMsg: 'Password must be at least 8 characters long',
          toastType: TOAST_TYPE.toastError);
      FocusScope.of(Get.overlayContext!).requestFocus(passwordFocusNode);
      return false;
    }
    if ((confirmPasswordController.text != passwordController.text)) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "ok",
          strMsg: 'Password must match',
          toastType: TOAST_TYPE.toastError);
      FocusScope.of(Get.overlayContext!).requestFocus(confirmPasswordFocusNode);
      return false;
    }
    if (await Database.isUserExist(emailController.text.toString().trim())) {
      EasyLoading.dismiss();
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "ok",
          strMsg: 'An account with this email already exists.',
          toastType: TOAST_TYPE.toastError);
      return false;
    }
    if ((!terms)) {
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "ok",
          strMsg: 'You must be agreed with out terms & condition',
          toastType: TOAST_TYPE.toastError);
      return false;
    }
    return true;
  }

  Future<void> createUser() async {
    try {
      if (!(await initvalidation())) {
        return;
      }
      EasyLoading.show();
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text);

      if (userCredential.user != null) {
        UserModel userModel = UserModel(
            id: userCredential.user!.uid,
            fname: firstNameController.text,
            lname: lastNameController.text,
            email: emailController.text.trim(),
            image: '',
            emailVerified: userCredential.user!.emailVerified);
        await Database.createUserInDatabase(userModel);
        await Get.find<UserDetail>().setData(userModel.toMap());
        await Get.find<UserDetail>().getData();

        Get.offAll(Home());
        EasyLoading.dismiss();
        update();
      } else {
        update();
        Global.showToastAlert(
            context: Get.overlayContext!,
            strTitle: "",
            strMsg: 'Something went wrong',
            toastType: TOAST_TYPE.toastError);
      }
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'weak-password') {
        Global.showToastAlert(
            context: Get.overlayContext!,
            strTitle: "",
            strMsg: 'Password is too weak',
            toastType: TOAST_TYPE.toastError);
      } else if (e.code == 'email-already-in-use') {
        Global.showToastAlert(
            context: Get.overlayContext!,
            strTitle: "",
            strMsg: 'Email is already in use by someone else',
            toastType: TOAST_TYPE.toastError);
      }
    } catch (e) {
      EasyLoading.dismiss();
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "",
          strMsg: e.toString(),
          toastType: TOAST_TYPE.toastError);
    }
  }

  Future<void> resetPassowrd() async {
    try {
      if (!Global.checkNull(emailController.text.toString().trim())) {
        Global.showToastAlert(
            context: Get.overlayContext!,
            strTitle: "",
            strMsg: 'Please enter email',
            toastType: TOAST_TYPE.toastError);
        FocusScope.of(Get.overlayContext!).requestFocus(emailFocusNode);
        return;
      }
      EasyLoading.show();
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      emailController.clear();
      Global.showToastAlert(
          context: Get.overlayContext!,
          strTitle: "",
          strMsg:
              'If the email you provided exists in our databases as a valid user, you will receive an email with reset instructions',
          toastType: TOAST_TYPE.toastSuccess);
      EasyLoading.dismiss();
      Get.back();
      update();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        Global.showToastAlert(
            context: Get.overlayContext!,
            strTitle: "ok",
            strMsg:
                "We couldn't find an account with the provided email address",
            toastType: TOAST_TYPE.toastError);
      }
    }
  }
}
