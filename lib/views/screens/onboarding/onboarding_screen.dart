import 'package:fashion_app/constants/my_colors.dart';
import 'package:fashion_app/providers/onboarding_provider.dart';
import 'package:fashion_app/views/screens/onboarding/widgets/onboard_page_one.dart';
import 'package:fashion_app/views/screens/onboarding/widgets/onboard_page_two.dart';
import 'package:fashion_app/views/screens/onboarding/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // ignore: unused_field
  late final PageController _pageController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var onboardProv = Provider.of<OnboardingProvider>(context, listen: false);
      _pageController = PageController(initialPage: onboardProv.selectedPage);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(builder: (context, value, child) {
      return Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (page) {
                value.setSelected(page);
              },
              children: const [
                OnboardingScreenOne(),
                OnboardingScreenTwo(),
                WelcomeScreen(),
              ],
            ),
            value.selectedPage == 2
                ? const SizedBox.shrink()
                : Positioned(
                    bottom: 50.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      width: ScreenUtil().screenWidth,
                      child: Row(
                        children: [
                          value.selectedPage == 0
                              ? const SizedBox(width: 25)
                              : GestureDetector(
                                  onTap: () {
                                    _pageController.animateToPage(
                                      value.selectedPage - 1,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  child: const Icon(
                                    AntDesign.leftcircleo,
                                    color: MyColors.kPrimary,
                                    size: 30,
                                  ),
                                ),
                          SizedBox(
                            width: ScreenUtil().screenWidth * 0.7,
                            height: 50.h,
                            child: PageViewDotIndicator(
                              currentItem: value.selectedPage,
                              count: 3,
                              unselectedColor: Colors.black26,
                              selectedColor: MyColors.kPrimary,
                              duration: const Duration(milliseconds: 200),
                              onItemClicked: (index) {
                                _pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(
                                  value.selectedPage + 1,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn);
                            },
                            child: const Icon(
                              AntDesign.rightcircleo,
                              color: MyColors.kPrimary,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
