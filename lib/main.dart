import 'package:certificateapp/globals/adaptive_helper.dart';
import 'package:certificateapp/globals/widgets/custome_scroll.dart';
import 'package:certificateapp/screens/home/home_screen.dart';
import 'package:certificateapp/screens/intro/intro_screen.dart';
import 'package:certificateapp/utils/app_theme_input_dec.dart';
import 'package:certificateapp/utils/login_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  var user = Get.put(UserDetail());
  await user.getData();
  var login = await user.isLogin();

  runApp(
    OverlaySupport(child: BoosterMaterialApp(login: login)),
  );
}

class BoosterMaterialApp extends StatelessWidget {
  final bool login;
  const BoosterMaterialApp({Key? key, required this.login}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrainst) {
        SizeConfig().init(context);
        return GetMaterialApp(
          title: "CertificateApp",
          // builder: FToastBuilder(),
          themeMode: ThemeMode.light,
          theme: AppTheme.data(),
          fallbackLocale: const Locale('en', 'US'),
          locale: const Locale('en', 'US'),
          defaultTransition: Transition.cupertino,
          debugShowCheckedModeBanner: false,
          home: login ? Home() : IntroScreen(),
          builder: EasyLoading.init(),
          // builder: (context, child) {
          //   // ignore system scale factor
          //   return MediaQuery(
          //       data: MediaQuery.of(context).copyWith(
          //         textScaleFactor: 1.0,
          //       ),
          //       child: ScrollConfiguration(
          //         behavior: CustomBehavior(),
          //         child: child!,
          //       ));
          // },
        );
      },
    );
  }
}
