import 'package:fashion_app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/my_colors.dart';
import '../../../widgets/app_style.dart';
import '../../../widgets/reusable_text.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: SizedBox(
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            categories.length,
            (index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {},
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: MyColors.kSecondaryLight,
                        child: Padding(
                          padding: EdgeInsets.all(4.h),
                          child: SvgPicture.network(
                            category.imageUrl,
                            width: 40.w,
                            height: 40.h,
                          ),
                        ),
                      ),
                      ReusableText(
                        text: category.title,
                        style: appStyle(12, MyColors.kGray, FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
