import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/app_style.dart';
import 'package:grozziieapk/ui/create_label.dart';

/*class DashboardScreen extends StatefulWidget {

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double containerX = 250.0;
  double containerY = 500.0;
  double dragX = 0.0;
  double dragY = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 15.h),
                  Container(
                    padding:
                    REdgeInsets.symmetric(horizontal: 15, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(appIcon),
                        Image.asset('assets/icons/user_icon.png'),
                      ],
                    ),
                  ),
                  Container(
                    margin: REdgeInsets.only(left: 15, top: 15, right: 15),
                    height: 130.h,
                    width: 340.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/banner_image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  _buildContainerPrint(),
                  _buildCreatedLabel(),
                  Container(
                    margin: REdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recent usage',
                      style: bodyMedium.copyWith(
                          fontSize: 18.sp, fontFamily: pMedium),
                    ),
                  ),
                  _buildRecentUsage(),
                ],
              ),
              Positioned(
                left: containerX,
                top: containerY,
                child: SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Image.asset('assets/icons/chat_icon.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildRecentUsage() {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 15, vertical: 5),
      height: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1AADFF).withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }

  Container _buildCreatedLabel() {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 100.h,
      width: 335.w,
      decoration: const BoxDecoration(
          color: primaryBlue,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/icons/created_label_add_icon.png'),
          ),
          Text(
            'Create Label',
            style: bodySmall.copyWith(
                color: Colors.white,
                fontFamily: pRegular,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Container _buildContainerPrint() {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: REdgeInsets.all(5),
            height: 30.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/dot_icon.png'),
                SizedBox(width: 5.w),
                Text(
                  'Dot Printer',
                  style: bodySmall.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: pRegular),
                ),
              ],
            ),
          ),
          Container(
            padding: REdgeInsets.all(5),
            height: 30.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/thermal_icon.png'),
                SizedBox(width: 5.w),
                Text(
                  'Thermal',
                  style: bodySmall.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: pRegular),
                ),
              ],
            ),
          ),
          Container(
            padding: REdgeInsets.all(5),
            height: 30.h,
            width: 105.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/dot_icon.png'),
                SizedBox(width: 5.w),
                Text(
                  'Attendance',
                  style: bodySmall.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: pRegular),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    const iconSize = 120; // Adjust the size based on your icon dimensions
    final touchX = details.globalPosition.dx;
    final touchY = details.globalPosition.dy;
    final containerWidth = MediaQuery.of(context).size.width;
    final containerHeight = MediaQuery.of(context).size.height;

    final iconX = (containerWidth - iconSize) / 2;
    final iconY = (containerHeight - iconSize) / 2;

    final touchOffsetX = touchX - iconX;
    final touchOffsetY = touchY - iconY;

    if (touchOffsetX >= 0 && touchOffsetX <= iconSize && touchOffsetY >= 0 && touchOffsetY <= iconSize) {
      dragX = touchOffsetX;
      dragY = touchOffsetY;
    } else {
      dragX = 0.0;
      dragY = 0.0;
    }
  }


  void onPanUpdate(DragUpdateDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const iconSize = 120.0; // Adjust the size based on the updated icon size

    final maxX = screenWidth - iconSize;
    final maxY = screenHeight - iconSize;

    setState(() {
      containerX = (details.globalPosition.dx - dragX).clamp(0.0, maxX);
      containerY = (details.globalPosition.dy - dragY).clamp(0.0, maxY);
    });
  }

}*/


class DashboardScreen extends StatefulWidget {

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double containerX = 250.0;
  double containerY = 500.0;
  double dragX = 0.0;
  double dragY = 0.0;
  double iconSize = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 15.h),
                  Container(
                    padding: REdgeInsets.symmetric(horizontal: 15, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(appIcon),
                        Image.asset('assets/icons/user_icon.png'),
                      ],
                    ),
                  ),
                  Container(
                    margin: REdgeInsets.only(left: 15, top: 15, right: 15),
                    height: 130.h,
                    width: 340.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/banner_image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  _buildContainerPrint(),
                  _buildCreatedLabel(),
                  Container(
                    margin: REdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recent usage',
                      style: bodyMedium.copyWith(fontSize: 18.sp, fontFamily: pMedium),
                    ),
                  ),
                  _buildRecentUsage(),
                ],
              ),
              Positioned(
                left: containerX,
                top: containerY,
                child: SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Image.asset('assets/icons/chat_icon.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildRecentUsage() {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 15, vertical: 5),
      height: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1AADFF).withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }

  Container _buildCreatedLabel() {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 100.h,
      width: 335.w,
      decoration: const BoxDecoration(
          color: primaryBlue,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreateLabel(),));
            },
            icon: Image.asset('assets/icons/created_label_add_icon.png'),
          ),
          Text(
            'Create Label',
            style: bodySmall.copyWith(
                color: Colors.white,
                fontFamily: pRegular,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Container _buildContainerPrint() {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: REdgeInsets.all(5),
            height: 30.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/dot_icon.png'),
                SizedBox(width: 5.w),
                Text(
                  'Dot Printer',
                  style: bodySmall.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: pRegular),
                ),
              ],
            ),
          ),
          Container(
            padding: REdgeInsets.all(5),
            height: 30.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/thermal_icon.png'),
                SizedBox(width: 5.w),
                Text(
                  'Thermal',
                  style: bodySmall.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: pRegular),
                ),
              ],
            ),
          ),
          Container(
            padding: REdgeInsets.all(5),
            height: 30.h,
            width: 105.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/dot_icon.png'),
                SizedBox(width: 5.w),
                Text(
                  'Attendance',
                  style: bodySmall.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: pRegular),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    const iconSize = 120; // Adjust the size based on your icon dimensions
    final touchX = details.globalPosition.dx;
    final touchY = details.globalPosition.dy;
    final containerWidth = MediaQuery.of(context).size.width;
    final containerHeight = MediaQuery.of(context).size.height;

    final iconX = (containerWidth - iconSize) / 2;
    final iconY = (containerHeight - iconSize) / 2;

    final touchOffsetX = touchX - iconX;
    final touchOffsetY = touchY - iconY;

    if (touchOffsetX >= 0 && touchOffsetX <= iconSize && touchOffsetY >= 0 && touchOffsetY <= iconSize) {
      dragX = touchOffsetX;
      dragY = touchOffsetY;
    } else {
      dragX = 0.0;
      dragY = 0.0;
    }
  }

  void onPanUpdate(DragUpdateDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const iconSize = 120.0; // Adjust the size based on the updated icon size

    final maxX = screenWidth - iconSize;
    final maxY = screenHeight - iconSize;

    final touchX = details.globalPosition.dx;
    final touchY = details.globalPosition.dy;

    final containerWidth = MediaQuery.of(context).size.width;

    final iconX = (containerWidth - iconSize) / 2;

    final touchOffsetX = touchX - iconX;

    setState(() {
      containerX = (touchOffsetX >= containerWidth / 2) ? maxX : 0.0;
      containerY = (touchY - dragY).clamp(0.0, maxY);
    });
  }


}



