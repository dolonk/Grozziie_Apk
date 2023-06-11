import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/ui/signUp_screen.dart';

import '../app_style.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(loginBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.2),
              Image.asset(appIcon),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'LogIn',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontFamily: pSemiBold,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff004368),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/google_icon.png'),
                  ),
                  SizedBox(width: 16.w),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/facebook_icon.png'),
                  ),
                  SizedBox(width: 16.w),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/wechat_icon.png'),
                  ),
                ],
              ),
              Text(
                'Or',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: pLight,
                  fontWeight: FontWeight.w300,
                  color: kTextColor,
                ),
              ),
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
              SizedBox(height: 10.h),
              Padding(
                padding: REdgeInsets.only(right: 20.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget password',
                    style: TextStyle(
                      fontFamily: pMedium,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: kTextColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 17.h),
              ReusableButton(
                text: 'LogIn',
                onPressed: () {},
                height: 57.h,
                width: 163.w,
                buttonColor: const Color(0xff004368),
              ),
              SizedBox(height: screenHeight * 0.12),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        fontFamily: pLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    TextSpan(
                      text: 'Create an account',
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
                              builder: (context) => SignUpScreen(),
                            ),
                          );
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

