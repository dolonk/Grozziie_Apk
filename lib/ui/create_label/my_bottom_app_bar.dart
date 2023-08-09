import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBottomAppBar{
  static buildBottomAppBarButton(double screenWidth) {
    return BottomAppBar(
      child: Container(
        width: screenWidth,
        height: 60.h,
        color: const Color(0xff5DBCFF).withOpacity(0.13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  padding: REdgeInsets.symmetric(vertical: 11, horizontal: 50),
                  primary: const Color(0xff004368),
                  textStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.bold)),
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  padding: REdgeInsets.symmetric(vertical: 11, horizontal: 50),
                  primary: Colors.white,
                  textStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.bold)),
              child: const Text(
                'Print',
                style: TextStyle(color: Colors.black45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}