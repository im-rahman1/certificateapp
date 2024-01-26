import 'package:certificateapp/controllers/widget_controllers.dart/appbar_controller.dart';
import 'package:certificateapp/globals/adaptive_helper.dart';
import 'package:certificateapp/utils/app_colors.dart';
import 'package:certificateapp/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget forwardAppBar(String title, Function onForward, {bool toHome = false}) {
  return SizedBox(
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () =>
              toHome ? Get.back() : Get.find<NavBarController>().changeTab(0),
          child: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: -0.8,
              child: Image.asset(
                'assets/images/ic_add_bottom.png',
                height: 20,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 30,
            child: Text(
              title,
              style: subHeadingText(size: 15),
            ),
          ),
        ),
        InkWell(
          onTap: () => onForward(),
          child: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/ic_arrow_forward.png',
              height: 20,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget backArrowAppBar(String title,
    {bool toHome = false, bool isCentered = false, Color? textColor}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () =>
              toHome ? Get.find<NavBarController>().changeTab(0) : Get.back(),
          child: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/ic_arrow_back.png',
              color: textColor ?? AppColors.h1,
              height: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            alignment: isCentered ? Alignment.center : Alignment.centerLeft,
            height: 30,
            child: Text(
              title,
              maxLines: 1,
              style: subHeadingText(size: 15)
                  .copyWith(color: textColor ?? AppColors.h1),
            ),
          ),
        ),
        const SizedBox(
          width: 50,
        )
      ],
    ),
  );
}

AppBar customAppBar(dynamic title,
    {bool isCentered = false,
    Color? color,
    leading = true,
    isMain = false,
    Function? onBack,
    List<Widget> action = const [],
    TextStyle? style}) {
  return AppBar(
    title: title is String
        ? Text(
            title,
            style:
                style ?? subHeadingText(size: 18, color: AppColors.colorWhite),
          )
        : title,
    titleTextStyle: regularText(size: 18),
    elevation: 8,
    automaticallyImplyLeading: leading,
    centerTitle: isCentered,
    leading: leading
        ? Padding(
            padding: EdgeInsets.only(left: wd(5)),
            child: IconButton(
                onPressed: () {
                  if (onBack != null) {
                    onBack();
                  } else {
                    if (isMain) {
                      Get.find<NavBarController>().changeTab(0);
                    } else {
                      Get.back();
                    }
                  }
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primaryColor,
                )),
          )
        : null,
    actions: action,
    backgroundColor: color ?? AppColors.scaffoldBacground,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
