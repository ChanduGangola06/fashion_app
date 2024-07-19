import 'package:fashion_app/constants/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../constants/resources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
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
