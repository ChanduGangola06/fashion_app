import 'package:fashion_app/constants/my_colors.dart';
import 'package:fashion_app/utils/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/resources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigator();
    super.initState();
  }

  _navigator() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      if (Storage().getBool('firstOpen') == null) {
        //Go to the onboarding screen
        GoRouter.of(context).go('/onboarding');
      } else {
        //Go to home page
        GoRouter.of(context).go('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.kWhite,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.ASSETS_IMAGES_SPLASHSCREEN_PNG),
          ),
        ),
      ),
    );
  }
}
