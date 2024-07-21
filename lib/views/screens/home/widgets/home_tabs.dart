import 'package:fashion_app/constants/my_colors.dart';
import 'package:fashion_app/views/widgets/app_style.dart';
import 'package:fashion_app/views/widgets/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabs extends StatelessWidget {
  final TabController _tabController;
  HomeTabs({super.key, required TabController tabController})
      : _tabController = tabController;

  List<String> homeTabs = ['All', 'Popular', 'Unisex', 'Men', 'Women', 'Kids'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
            color: MyColors.kPrimary, borderRadius: BorderRadius.circular(25)),
        labelPadding: EdgeInsets.zero,
        labelColor: MyColors.kWhite,
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        labelStyle: appStyle(11, MyColors.kPrimary, FontWeight.w600),
        unselectedLabelStyle: appStyle(11, MyColors.kGray, FontWeight.normal),
        tabs: List.generate(
          homeTabs.length,
          (i) => Tab(
            child: TabWidget(
              text: homeTabs[i],
            ),
          ),
        ),
      ),
    );
  }
}
