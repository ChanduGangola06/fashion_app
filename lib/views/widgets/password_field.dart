import 'package:fashion_app/constants/my_colors.dart';
import 'package:fashion_app/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_style.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required this.controller,
    this.focusNode,
    this.radius,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode? focusNode;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextFormField(
            cursorColor: Colors.black,
            textInputAction: TextInputAction.next,
            focusNode: focusNode,
            keyboardType: TextInputType.visiblePassword,
            controller: controller,
            obscureText: value.password,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter a valid password";
              } else {
                return null;
              }
            },
            style: appStyle(12, MyColors.kDark, FontWeight.normal),
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  value.setPassword();
                },
                child: Icon(
                  value.password ? Icons.visibility : Icons.visibility_off,
                  color: MyColors.kGrayLight,
                ),
              ),
              hintText: 'Password ',
              prefixIcon: const Icon(
                CupertinoIcons.lock_circle,
                color: MyColors.kGrayLight,
                size: 26,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.all(6),
              hintStyle: appStyle(12, MyColors.kGray, FontWeight.normal),
              // contentPadding: EdgeInsets.only(left: 24),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 0.5),
                  borderRadius:
                      BorderRadius.all(Radius.circular(radius ?? 12))),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: MyColors.kPrimary, width: 0.5),
                  borderRadius:
                      BorderRadius.all(Radius.circular(radius ?? 12))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: MyColors.kRed, width: 0.5),
                  borderRadius:
                      BorderRadius.all(Radius.circular(radius ?? 12))),
              disabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: MyColors.kGray, width: 0.5),
                  borderRadius:
                      BorderRadius.all(Radius.circular(radius ?? 12))),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: MyColors.kGray, width: 0.5),
                  borderRadius:
                      BorderRadius.all(Radius.circular(radius ?? 12))),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: MyColors.kPrimary, width: 0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? 12),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
