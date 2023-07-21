import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelContainer extends StatelessWidget {
  const LabelContainer({Key? key, required this.screenWidth}) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: double.infinity,
      margin: REdgeInsets.symmetric(horizontal: 10,vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenUtil().setWidth(13)),
        ),
      ),
      child: Center(
        child: Text(
          'Tap to edit \n      text',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(16),
            color: Colors.black.withOpacity(0.8),
            fontFamily: 'Poppins-Regular',
          ),
        ),
      ),
    );
  }
}