

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}


class ReuseAbleClass {

  buildOptionRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: children,
    );
  }

  buildIconButton(String imagePath, String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: 55.w,
        child: Column(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: Image.asset(
                imagePath,
                width: 24.w,
                height: 24.h,
              ),
              color: Colors.grey,
            ),
            SizedBox(height: 5.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black45,
                fontFamily: 'Poppins-Regular',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextIonButton(
      String imagePath, String label, VoidCallback onPressed) {
    return SizedBox(
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Image.asset(
              imagePath,
              width: 24.w,
              height: 24.h,
            ),
            color: Colors.grey,
          ),
          SizedBox(height: 5.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black45,
              fontFamily: 'Poppins-Regular',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

}

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black26, width: 1),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 16.0, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}