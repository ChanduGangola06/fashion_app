import 'package:fashion_app/constants/my_colors.dart';
import 'package:fashion_app/constants/my_strings.dart';
import 'package:fashion_app/views/widgets/app_style.dart';
import 'package:fashion_app/views/widgets/reusable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
            text: AppText.kCategories,
            style: appStyle(13, MyColors.kDark, FontWeight.w600)),
        GestureDetector(
          onTap: () {
            //context.push('/categories');
          },
          child: ReusableText(
              text: AppText.kViewAll,
              style: appStyle(13, MyColors.kGray, FontWeight.normal)),
        ),
      ],
    );
  }
}
