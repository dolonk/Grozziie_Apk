import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/ui/login_section/login_screen.dart';

import '../../app_style.dart';
import '../../resourcs/auth_methods.dart';
import '../../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    super.dispose();
    _userName.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
  }

  void _signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    String userName = _userName.text;
    String email = _email.text;
    String password = _password.text;
    String confirmPassword = _confirmPassword.text;

    if (password != confirmPassword) {
      setState(() {
        _isLoading = false;
      });
      showSnackBar("Passwords do not match", context);
      return;
    }

    String res = await AuthMethod().signUpUser(
      userName: userName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    setState(() {
      _isLoading = false;
    });

    if (res != 'Success') {
      showSnackBar(res, context);
    } else {
      showSnackBar('Signup Successfully', context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    }
  }


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
              InputEditText(
                controller: _userName,
                hintText: 'UserName',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 17.h),
              InputEditText(
                controller: _email,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 17.h),
              InputEditText(
                controller: _password,
                hintText: 'Enter password',
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Image.asset(
                      _isPasswordVisible
                          ? 'assets/icons/password_visible_icon.png'
                          : 'assets/icons/pass_icon.png',
                      color: Colors.black,
                      width: 24,
                      height: 24,
                    )),
                textInputType: TextInputType.text,
                isPass: !_isPasswordVisible,
              ),
              SizedBox(height: 17.h),
              InputEditText(
                controller: _confirmPassword,
                hintText: 'Confirm password',
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                    icon: Image.asset(
                      _isConfirmPasswordVisible
                          ? 'assets/icons/password_visible_icon.png'
                          : 'assets/icons/pass_icon.png',
                      color: Colors.black,
                      width: 24,
                      height: 24,
                    )),
                textInputType: TextInputType.text,
                isPass: !_isConfirmPasswordVisible,
              ),
              SizedBox(height: 40.h),
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                  : ReusableButton(
                      text: 'Create account',
                      onPressed: () {
                        _signUpUser();
                      },
                      height: 50.h,
                      width: 263.w,
                      buttonColor: primaryBlue,
                    ),
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
