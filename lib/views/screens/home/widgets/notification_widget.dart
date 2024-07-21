import 'package:fashion_app/constants/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: CircleAvatar(
          backgroundColor: MyColors.kGrayLight.withOpacity(.3),
          child: Badge(
            label: Text("0"),
            child: const Icon(
              Ionicons.notifications,
              color: MyColors.kPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
