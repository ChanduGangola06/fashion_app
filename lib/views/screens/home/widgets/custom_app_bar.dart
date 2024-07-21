import 'package:fashion_app/views/screens/home/widgets/notification_widget.dart';
import 'package:fashion_app/views/widgets/app_style.dart';
import 'package:fashion_app/views/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../constants/my_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: ReusableText(
                text: "Location",
                style: appStyle(12, MyColors.kGray, FontWeight.normal)),
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              const Icon(
                Ionicons.location,
                size: 16,
                color: MyColors.kPrimary,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: SizedBox(
                  width: ScreenUtil().screenWidth * 0.7,
                  child: Text(
                    "Please select a location",
                    maxLines: 1,
                    style: appStyle(14, MyColors.kDark, FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: const [
        NotificationWidget(),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Container(
                    height: 50.h,
                    width: ScreenUtil().screenWidth - 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: MyColors.kGrayLight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Ionicons.search,
                            size: 20,
                            color: MyColors.kPrimaryLight,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          ReusableText(
                            text: "Search Products",
                            style:
                                appStyle(14, MyColors.kGray, FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: MyColors.kPrimary,
                      borderRadius: BorderRadius.circular(9)),
                  child: const Icon(
                    FontAwesome.sliders,
                    color: MyColors.kWhite,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
