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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
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
        leading: AppBackButton(
          onTap: () {
            context.go('/home');
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 160.h),
          Text(
            'Robin Singh',
            textAlign: TextAlign.center,
            style: appStyle(
              24,
              MyColors.kPrimary,
              FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Hi! Welcome back. You've been missed",
            textAlign: TextAlign.center,
            style: appStyle(13, MyColors.kGray, FontWeight.normal),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                EmailTextField(
                  radius: 25,
                  focusNode: _passwordNode,
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
                SizedBox(
                  height: 25.h,
                ),
                PasswordField(
                  controller: _passwordController,
                  focusNode: _passwordNode,
                  radius: 25,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  text: "LOGIN",
                  onTap: () {
                    context.go('/home');
                  },
                  btnWidth: ScreenUtil().screenWidth,
                  btnHieght: 40,
                  radius: 20,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 130.h,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 110.0),
            child: GestureDetector(
              onTap: () {
                context.push('/register');
              },
              child: Text(
                'Do not have an account? Register a new one',
                style: appStyle(12, Colors.blue, FontWeight.normal),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
