import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_style.dart';
import 'login_screen.dart';



class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(sPlashBackground),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
