import 'package:fashion_app/constants/constants.dart';
import 'package:fashion_app/constants/my_colors.dart';
import 'package:fashion_app/constants/my_strings.dart';
import 'package:fashion_app/views/widgets/app_style.dart';
import 'package:fashion_app/views/widgets/reusable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../widgets/custom_button.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kRadiusAll,
      child: Stack(
        children: [
          SizedBox(
            height: ScreenUtil().screenHeight * 0.16,
            width: ScreenUtil().screenWidth,
            child: ImageSlideshow(
              indicatorColor: MyColors.kPrimaryLight,
              onPageChanged: (p) {},
              autoPlayInterval: 5000,
              isLoop: true,
              children: List.generate(images.length, (i) {
                return CachedNetworkImage(
                  placeholder: placeholder,
                  errorWidget: errorWidget,
                  imageUrl: images[i],
                  fit: BoxFit.cover,
                );
              }),
            ),
          ),
          Positioned(
            child: SizedBox(
              height: ScreenUtil().screenHeight * 0.16,
              width: ScreenUtil().screenWidth,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                        text: AppText.kCollection,
                        style: appStyle(20, MyColors.kDark, FontWeight.w600)),
                    SizedBox(height: 5.h),
                    Text(
                      'Discount 50% off \nthe first transaction',
                      style: appStyle(14, MyColors.kDark.withOpacity(.6),
                          FontWeight.normal),
                    ),
                    SizedBox(height: 10.h),
                    CustomButton(text: "Shop Now", btnWidth: 150.w)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
