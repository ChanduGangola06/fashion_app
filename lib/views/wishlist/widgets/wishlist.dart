import 'package:fashion_app/constants/constants.dart';
import 'package:fashion_app/views/screens/products/widgets/staggered_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: StaggeredGrid.count(
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        crossAxisCount: 4,
        children: List.generate(
          products.length,
          (i) {
            final double mainAxisCellCount = (i % 2 == 0 ? 2.17 : 2.4);
            final product = products[i];
            return StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: mainAxisCellCount,
              child: StaggeredTileWidget(
                onTap: () {},
                product: product,
                i: i,
              ),
            );
          },
        ),
      ),
    );
  }
}
