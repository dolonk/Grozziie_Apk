
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar{
  buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xffFFFFFF),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.grey,
      ),
      title: Center(
        child: Text(
          '1/1 \n 45mm*30mm',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: ScreenUtil().setSp(16),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/undo.png'),
          color: Colors.grey,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/info.png'),
          color: Colors.grey,
        ),
      ],
    );
  }
}