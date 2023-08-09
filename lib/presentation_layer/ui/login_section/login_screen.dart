import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/ui/login_section/signUp_screen.dart';
import '../../../utils/app_style.dart';
import '../../../utils/utils.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void _loginUser() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final String email = _email.text.trim();
      final String password = _password.text.trim();

      if (email.isNotEmpty && password.isNotEmpty) {
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (userCredential.user != null) {
          // Login successful
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          showSnackBar('Login failed. Please try again.', context);
        }
      } else {
        showSnackBar('Please enter all fields', context);
      }
    } catch (error) {
      showSnackBar('Login failed. ${error.toString()}', context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
              Image.asset(loginAppIcon),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'LogIn',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontFamily: pSemiBold,
                  fontWeight: FontWeight.w600,
                  color: primaryBlue,
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
              InputEditText(
                controller: _email,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 17.h),
              InputEditText(
                controller: _password,
                hintText: 'Password',
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
                    width: 50,
                  ),
                ),
                textInputType: TextInputType.text,
                isPass: true,
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
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                  : ReusableButton(
                      text: 'LogIn',
                      onPressed: () {
                        _loginUser();
                      },
                      height: 50.h,
                      width: 163.w,
                      buttonColor: primaryBlue,
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
                        color: primaryBlue,
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
