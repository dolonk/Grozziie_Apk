
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateLabel extends StatelessWidget {
  const CreateLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the screen size variables using ScreenUtil
    double screenWidth = ScreenUtil().screenWidth;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildLabelContainer(screenWidth),
          Expanded(child: _buildOptionsContainer(context, screenWidth)),
        ],
      ),
      bottomNavigationBar: buildBottomAppBarButton(screenWidth),
    );
  }

  BottomAppBar buildBottomAppBarButton(double screenWidth) {
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
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

  Widget _buildLabelContainer(double screenWidth) {
    return Container(
      margin: EdgeInsets.only(
        left: 75.w,
        top: 40.h,
        right: 75.w,
        bottom: 40.h,
      ),
      height: 180.h,
      width: 260,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
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

  Widget _buildOptionsContainer(BuildContext context, double screenWidth) {
    return Stack(children: [
      Container(
        padding: REdgeInsets.only(bottom: 30.h),
        margin: REdgeInsets.only(top: 10.h),
        alignment: Alignment.topCenter,
        child: Image.asset('assets/icons/rectangle.png'),
      ),
      Container(
        margin: REdgeInsets.only(top: 10.h),
        width: screenWidth,
        decoration: BoxDecoration(
          color: const Color(0xff5DBCFF).withOpacity(0.13),
          borderRadius: BorderRadius.all(Radius.circular(13.w)),
        ),
        child: Column(
          children: [
            _buildOptionRow(
              [
                _buildIconButton(
                    'assets/icons/template.png', 'Template', () {}),
                Image.asset('assets/images/line_c.png'),
                _buildIconButton('assets/icons/empty.png', 'Empty', () {}),
                _buildIconButton(
                    'assets/icons/multiple.png', 'Multiple', () {}),
                _buildIconButton('assets/icons/undo (2).png', 'Undo', () {}),
                _buildIconButton('assets/icons/redo.png', 'Redo', () {}),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: SingleChildScrollView(
                // Wrap _buildOptions with SingleChildScrollView
                child: _buildOptions(context, screenWidth),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _buildOptions(context, screenWidth) {
    return Container(
      height: 230.h,
      width: screenWidth,
      color: Colors.white54,
      padding: REdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          _buildOptionRow(
            [
              _buildIconButton('assets/icons/text.png', 'Text', () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TextEditorPage(),
                    ));*/
              }),
              _buildIconButton('assets/icons/barcode.png', 'Barcode', () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BarCodeGenerator(),
                    ));*/
              }),
              _buildIconButton('assets/icons/qrcode.png', 'QR Code', () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QrCodeGenerator(),
                    ));*/
              }),
              _buildIconButton('assets/icons/table.png', 'Table', () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDataTable(),
                    ));*/
              }),
            ],
          ),
          SizedBox(height: 15.h),
          _buildOptionRow(
            [
              _buildIconButton('assets/icons/images.png', 'Image', () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InsertImage(),
                    ));*/
              }),
              _buildIconButton('assets/icons/scan.png', 'Scan', () {}),
              _buildIconButton(
                  'assets/icons/serial_number.png', 'Serial Number', () {}),
              _buildIconButton(
                  'assets/icons/insert_excel.png', 'Insert Excel', () {}),
            ],
          ),
          SizedBox(height: 15.h),
          _buildOptionRow(
            [
              _buildIconButton('assets/icons/time.png', 'Time', () {}),
              _buildIconButton('assets/icons/shape.png', 'Shape', () {}),
              _buildIconButton('assets/icons/line.png', 'Line', () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: children,
    );
  }

  Widget _buildIconButton(
      String imagePath, String label, VoidCallback onPressed) {
    return SizedBox(
      width: 60.w,
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
