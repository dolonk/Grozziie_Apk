import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OptionsContainer extends StatefulWidget {
  const OptionsContainer({
    Key? key,
    required this.context,
    required this.screenWidth,
  }) : super(key: key);

  final BuildContext context;
  final double screenWidth;

  @override
  State<OptionsContainer> createState() => _OptionsContainerState();
}

class _OptionsContainerState extends State<OptionsContainer> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;
    return Stack(
      children: [
        Container(
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
                    _buildIconButton(
                        'assets/icons/undo (2).png', 'Undo', () {}),
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
      ],
    );
  }

  Widget _buildOptions(context, screenWidth) {
    return Container(
      height: 230.h,
      width: screenWidth,
      color: Colors.white,
      padding: REdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          _buildOptionRow(
            [
              _buildIconButton('assets/icons/text.png', 'Text', () {

              }),
              _buildIconButton('assets/icons/qrcode.png', 'QR Code', () {

              }),
              _buildIconButton('assets/icons/table.png', 'Table', () {

              }),
            ],
          ),
          SizedBox(height: 15.h),
          _buildOptionRow(
            [
              _buildIconButton('assets/icons/images.png', 'Image', () {

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
