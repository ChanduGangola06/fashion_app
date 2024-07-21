import 'package:fashion_app/constants/my_colors.dart';
import 'package:fashion_app/views/widgets/app_style.dart';
import 'package:fashion_app/views/widgets/back_button.dart';
import 'package:fashion_app/views/widgets/custom_button.dart';
import 'package:fashion_app/views/widgets/email_textfield.dart';
import 'package:fashion_app/views/widgets/password_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: AppBackButton(),
      ),
      body: ListView(
        children: [
          SizedBox(height: 160.h),
          Text(
            "Best Fashions",
            textAlign: TextAlign.center,
            style: appStyle(24, MyColors.kPrimary, FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            "Hi! Welcome back. You've been missed",
            textAlign: TextAlign.center,
            style: appStyle(13, MyColors.kGray, FontWeight.normal),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                EmailTextField(
                  radius: 25,
                  hintText: "Username",
                  controller: _usernameController,
                  prefixIcon: const Icon(
                    CupertinoIcons.profile_circled,
                    size: 20,
                    color: MyColors.kGray,
                  ),
                  keyboardType: TextInputType.name,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_passwordNode);
                  },
                ),
                SizedBox(height: 25.h),
                EmailTextField(
                  radius: 25,
                  focusNode: _passwordNode,
                  hintText: "Email",
                  controller: _emailController,
                  prefixIcon: const Icon(
                    CupertinoIcons.mail,
                    size: 20,
                    color: MyColors.kGray,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(_passwordNode);
                  },
                ),
                SizedBox(height: 25.h),
                PasswordField(
                  controller: _passwordController,
                  focusNode: _passwordNode,
                  radius: 25,
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  onTap: () {
                    context.go('/main');
                  },
                  text: "REGISTER",
                  btnWidth: ScreenUtil().screenWidth,
                  btnHieght: 40,
                  radius: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
