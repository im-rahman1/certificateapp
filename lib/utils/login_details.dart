import 'dart:ffi';

import 'package:certificateapp/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:certificateapp/globals/constants.dart';

class UserDetail extends GetxController {
  String id = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  String image = "";
  bool emailVerified = false;
  bool islogin = false;

  Future<void> setData(Map result) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String id = result['id'] ?? '';
    String firstName = result['firstName'] ?? '';
    String lastName = result['lastName'] ?? '';
    String email = result['email'] ?? '';
    String image = result['image'] ?? '';
    bool emailVerified = result['emailVerified'] ?? false;

    await sharedPreferences.setString(SharedPrefKey.KEY_USER_ID, id);
    await sharedPreferences.setString(SharedPrefKey.KEY_FIRST_NAME, firstName);
    await sharedPreferences.setString(SharedPrefKey.KEY_LAST_NAME, lastName);
    await sharedPreferences.setString(SharedPrefKey.KEY_KEY_EMAIL, email);
    await sharedPreferences.setString(SharedPrefKey.KEY_USER_IMAGE, image);
    await sharedPreferences.setBool(
        SharedPrefKey.KEY_EMAIL_VERIFIED, emailVerified);
    await sharedPreferences.setBool(SharedPrefKey.KEY_IS_LOGIN, true);
    Get.find<UserDetail>().getData();
  }

  Future<void> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    firstName = sharedPreferences.getString(SharedPrefKey.KEY_FIRST_NAME) ?? '';
    lastName = sharedPreferences.getString(SharedPrefKey.KEY_LAST_NAME) ?? '';
    email = sharedPreferences.getString(SharedPrefKey.KEY_KEY_EMAIL) ?? '';
    image = sharedPreferences.getString(SharedPrefKey.KEY_USER_IMAGE) ?? '';
    emailVerified =
        sharedPreferences.getBool(SharedPrefKey.KEY_EMAIL_VERIFIED) ?? false;
    islogin = sharedPreferences.getBool(SharedPrefKey.KEY_IS_LOGIN) ?? false;
    update();
  }

  Future<bool> isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(SharedPrefKey.KEY_IS_LOGIN) ?? false;
  }

  Future<void> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    await sharedPreferences.remove(SharedPrefKey.KEY_IS_LOGIN);

    // await FirebaseAuth.instance.currentUser!.delete();
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const Login());
  }

  Future<void> updateImage(String n) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('image', n);
    image = n;
    update();
  }

  Future<void> updateProfile(String fn, String ln, img) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(SharedPrefKey.KEY_FIRST_NAME, fn);
    await sharedPreferences.setString(SharedPrefKey.KEY_LAST_NAME, ln);
    await sharedPreferences.setString(SharedPrefKey.KEY_USER_IMAGE, img);
    image = img;
    update();
  }
}
