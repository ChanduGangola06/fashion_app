import 'package:fashion_app/constants/my_colors.dart';
import 'package:fashion_app/constants/my_strings.dart';
import 'package:fashion_app/constants/resources.dart';
import 'package:fashion_app/views/widgets/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_WISHLIST_PNG,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 140,
            left: 30,
            right: 30,
            child: Text(
              AppText.kOnboardWishListMessage,
              textAlign: TextAlign.center,
              style: appStyle(11, MyColors.kGray, FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
