import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../../../constants/my_colors.dart';
import '../../../../data/models/products_model.dart';
import '../../../widgets/app_style.dart';
import '../../../widgets/reusable_text.dart';

class StaggeredTileWidget extends StatelessWidget {
  final int i;
  final Products product;
  final void Function()? onTap;
  StaggeredTileWidget({
    super.key,
    required this.i,
    required this.product,
    this.onTap,
  });

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: MyColors.kOffWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: i % 2 == 0 ? 163.h : 180.h,
                color: MyColors.kPrimary,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      height: i % 2 == 0 ? 163.h : 180.h,
                      fit: BoxFit.cover,
                      imageUrl: product.imageUrls[0],
                    ),
                    Positioned(
                      right: 10.h,
                      top: 10.h,
                      child: GestureDetector(
                        onTap: onTap,
                        child: CircleAvatar(
                          backgroundColor: MyColors.kSecondaryLight,
                          child: Icon(
                            AntDesign.heart,
                            color: isLiked ? MyColors.kRed : MyColors.kGray,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        style: appStyle(13, MyColors.kDark, FontWeight.w600),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          AntDesign.star,
                          color: MyColors.kGold,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        ReusableText(
                            text: product.ratings.toStringAsFixed(1),
                            style:
                                appStyle(13, MyColors.kGray, FontWeight.normal))
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: ReusableText(
                  text: '\$ ${product.price.toStringAsFixed(2)}',
                  style: appStyle(15, MyColors.kDark, FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
