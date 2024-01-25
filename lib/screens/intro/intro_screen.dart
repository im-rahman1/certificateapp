import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:certificateapp/globals/widgets/custom_button.dart';
import 'package:certificateapp/screens/auth/login_screen.dart';
import 'package:certificateapp/utils/app_colors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _pageController = PageController(viewportFraction: 1);
  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toDouble();
        print(currentPage);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Image.asset("assets/logo_white.png"))),
                Expanded(
                    child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: PageView(
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(
                                      right: 15, left: 15),
                                  width: currentPage,
                                  child: const Center(
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              Container(
                                  margin: const EdgeInsets.only(
                                      right: 15, left: 15),
                                  width: currentPage,
                                  child: const Center(
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              Container(
                                  margin: const EdgeInsets.only(
                                      right: 15, left: 15),
                                  width: currentPage,
                                  child: const Center(
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                3,
                                (index) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    alignment: Alignment.centerLeft,
                                    height: 9,
                                    width: 9,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentPage == index
                                          ? Colors.white
                                          : Colors.black12,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: CustomButton(
                              label: "Get Started",
                              onPress: () {
                                Get.to(() => const Login());
                              },
                            )))
                  ],
                ))
              ],
            )),
          )),
    );
  }
}
