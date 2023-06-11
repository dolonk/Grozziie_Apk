import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/ui/login_screen.dart';

import '../app_style.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),
              Text(
                'Create new account',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontFamily: pSemiBold,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff7B7B7B),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/google_icon.png')),
                  SizedBox(width: 16.w),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/facebook_icon.png')),
                  SizedBox(width: 16.w),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/wechat_icon.png')),
                ],
              ),
              Text('Or',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: pLight,
                    fontWeight: FontWeight.w300,
                    color: kTextColor,
                  )),
              InputEditText(controller: _userName, hintText: 'UserName'),
              SizedBox(height: 17.h),
              InputEditText(controller: _email, hintText: 'Email'),
              SizedBox(height: 17.h),
              InputEditText(
                controller: _password,
                hintText: 'Password',
                suffix: IconButton(
                  onPressed: () {},
                  icon: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/pass_icon.png',
                      color: Colors.black,
                      width: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 17.h),
              InputEditText(
                controller: _confirmPassword,
                hintText: 'Confirm password',
                suffix: IconButton(
                  onPressed: () {},
                  icon: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/pass_icon.png',
                      color: Colors.black,
                      width: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              ReusableButton(
                  text: 'Create account',
                  onPressed: () {},
                  height: 57.h,
                  width: 263.w,
                  buttonColor: const Color(0xff004368)),
              SizedBox(height: 18.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        fontFamily: pLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    TextSpan(
                      text: 'Log in',
                      style: TextStyle(
                        fontFamily: pSemiBold,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: const Color(0xff004368),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
