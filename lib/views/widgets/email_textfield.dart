import 'package:fashion_app/constants/my_colors.dart';
import 'package:fashion_app/views/widgets/app_style.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    this.prefixIcon,
    this.keyboardType,
    this.onEditingComplete,
    this.controller,
    this.hintText,
    this.focusNode,
    this.initialValue,
    this.radius,
  }) : super(key: key);
  final String? hintText;
  final double? radius;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: Colors.black,
        textInputAction: TextInputAction.next,
        onEditingComplete: onEditingComplete,
        keyboardType: keyboardType,
        initialValue: initialValue,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter a valid value";
          } else {
            return null;
          }
        },
        style: appStyle(12, MyColors.kDark, FontWeight.normal),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          isDense: true,
          contentPadding: const EdgeInsets.all(6),

          hintStyle: appStyle(12, MyColors.kGray, FontWeight.normal),
          // contentPadding: EdgeInsets.only(left: 24),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 12))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: MyColors.kPrimary, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 12))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 12))),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: MyColors.kGray, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 12))),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: MyColors.kGray, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 12))),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: MyColors.kPrimary, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 12),
            ),
          ),
        ));
  }
}
