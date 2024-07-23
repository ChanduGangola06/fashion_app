import 'package:fashion_app/constants/my_colors.dart';
import 'package:fashion_app/constants/my_strings.dart';
import 'package:fashion_app/views/widgets/app_style.dart';
import 'package:fashion_app/views/widgets/reusable_text.dart';
import 'package:fashion_app/views/wishlist/widgets/wishlist.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ReusableText(
          text: AppText.kWishlist,
          style: appStyle(16, MyColors.kPrimary, FontWeight.bold),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: WishlistWidget(),
      ),
    );
  }
}
