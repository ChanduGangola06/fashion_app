import 'package:fashion_app/constants/my_colors.dart';
import 'package:fashion_app/providers/bottom_tab_provider.dart';
import 'package:fashion_app/views/cart/cart_screen.dart';
import 'package:fashion_app/views/profile/profile_screen.dart';
import 'package:fashion_app/views/screens/home/home_screen.dart';
import 'package:fashion_app/views/widgets/app_style.dart';
import 'package:fashion_app/views/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      const HomeScreen(),
      const WishlistScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Consumer<TabIndexProvider>(
      builder: (context, bottomIndex, child) {
        return Scaffold(
          body: Stack(
            children: [
              pageList[bottomIndex.tabIndex],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(canvasColor: MyColors.kOffWhite),
                  child: BottomNavigationBar(
                    selectedFontSize: 12,
                    elevation: 0,
                    showSelectedLabels: true,
                    selectedLabelStyle:
                        appStyle(9, MyColors.kPrimary, FontWeight.w500),
                    showUnselectedLabels: false,
                    currentIndex: bottomIndex.tabIndex,
                    selectedItemColor: MyColors.kPrimary,
                    unselectedItemColor: MyColors.kGray,
                    unselectedIconTheme:
                        const IconThemeData(color: Colors.black38),
                    onTap: (i) {
                      bottomIndex.setIndex(i);
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: bottomIndex.tabIndex == 0
                              ? const Icon(
                                  AntDesign.home,
                                  color: MyColors.kPrimary,
                                  size: 24,
                                )
                              : const Icon(
                                  AntDesign.home,
                                  size: 24,
                                ),
                          label: "Home"),
                      BottomNavigationBarItem(
                          icon: bottomIndex.tabIndex == 1
                              ? const Icon(
                                  Ionicons.heart,
                                  color: MyColors.kPrimary,
                                  size: 24,
                                )
                              : const Icon(
                                  Ionicons.heart_outline,
                                ),
                          label: "Wishlist"),
                      BottomNavigationBarItem(
                          icon: bottomIndex.tabIndex == 2
                              ? Badge(
                                  label: Text('10'),
                                  child: const Icon(
                                    MaterialCommunityIcons.shopping,
                                    color: MyColors.kPrimary,
                                    size: 24,
                                  ),
                                )
                              : Badge(
                                  label: Text('0'),
                                  child: const Icon(
                                    MaterialCommunityIcons.shopping_outline,
                                  ),
                                ),
                          label: "Cart"),
                      BottomNavigationBarItem(
                          icon: bottomIndex.tabIndex == 3
                              ? const Icon(
                                  EvilIcons.user,
                                  color: MyColors.kPrimary,
                                  size: 34,
                                )
                              : const Icon(
                                  EvilIcons.user,
                                  size: 34,
                                ),
                          label: "Profile"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
