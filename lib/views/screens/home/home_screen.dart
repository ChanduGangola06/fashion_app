import 'package:fashion_app/providers/home_provider.dart';
import 'package:fashion_app/views/screens/home/widgets/categories_list.dart';
import 'package:fashion_app/views/screens/home/widgets/custom_app_bar.dart';
import 'package:fashion_app/views/screens/home/widgets/home_header.dart';
import 'package:fashion_app/views/screens/home/widgets/home_slider.dart';
import 'package:fashion_app/views/screens/home/widgets/home_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../products/widgets/explore_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  int _currentTabIndex = 0;
  List<String> homeTabs = ['All', 'Popular', 'Unisex', 'Men', 'Women', 'Kids'];

  @override
  void initState() {
    tabController = TabController(length: homeTabs.length, vsync: this);
    tabController.addListener(_handleSelection);
    super.initState();
  }

  void _handleSelection() {
    final controller = Provider.of<HomeProvider>(context, listen: false);
    if (tabController.indexIsChanging) {
      setState(() {
        _currentTabIndex = tabController.index;
      });
      controller.setIndex(homeTabs[_currentTabIndex]);
    }
  }

  @override
  void dispose() {
    tabController.removeListener(_handleSelection);
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: CustomAppBar(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        children: [
          SizedBox(height: 20.h),
          const HomeSlider(),
          SizedBox(height: 15.h),
          const HomeHeader(),
          SizedBox(height: 10.h),
          const HomeCategoriesList(),
          SizedBox(height: 15.h),
          HomeTabs(tabController: tabController),
          SizedBox(height: 15.h),
          const ExploreProducts(),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}
