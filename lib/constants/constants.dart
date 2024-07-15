import 'package:fashion_app/constants/my_colors.dart';
import 'package:flutter/material.dart';

LinearGradient kGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    MyColors.kPrimaryLight,
    MyColors.kWhite,
    MyColors.kPrimary,
  ],
);

LinearGradient kPGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    MyColors.kPrimaryLight,
    MyColors.kPrimaryLight.withOpacity(0.7),
    MyColors.kPrimary,
  ],
);

LinearGradient kBtnGradient = const LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.bottomRight,
  colors: [
    MyColors.kPrimaryLight,
    MyColors.kWhite,
  ],
);
