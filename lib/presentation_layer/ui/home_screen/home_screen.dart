import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/ui/home_screen/print_screen.dart';
import 'package:grozziieapk/presentation_layer/ui/home_screen/shop_screen.dart';
import 'package:grozziieapk/utils/app_style.dart';
import 'cart_screen.dart';
import 'dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  final List<Widget> screens = [
    DashboardScreen(),
    ShopScreen(),
    ChartScreen(),
    PrintScreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashboardScreen();

  ColorFilter _getColorFilter(int tabIndex) {
    return _currentTab == tabIndex
        ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
        : ColorFilter.mode(
            const Color(0xffFFFFFF).withOpacity(0.2), BlendMode.srcIn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: SizedBox(
          height: 70.h,
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: primaryBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: ColorFiltered(
                    colorFilter: _getColorFilter(0),
                    child: Image.asset('assets/icons/home_icon.png'),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentTab = 0;
                      currentScreen = DashboardScreen();
                    });
                  },
                ),
                IconButton(
                  icon: ColorFiltered(
                    colorFilter: _getColorFilter(1),
                    child: Image.asset('assets/icons/shop_icon.png'),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentTab = 1;
                      currentScreen = ShopScreen();
                    });
                  },
                ),
                SizedBox(width: 60.w),
                IconButton(
                  icon: ColorFiltered(
                    colorFilter: _getColorFilter(2),
                    child: Image.asset('assets/icons/cart_icon.png'),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentTab = 2;
                      currentScreen = ChartScreen();
                    });
                  },
                ),
                IconButton(
                  icon: ColorFiltered(
                    colorFilter: _getColorFilter(3),
                    child: Image.asset('assets/icons/print_icon.png'),
                  ),
                  onPressed: () {
                    setState(() {
                      _currentTab = 3;
                      currentScreen = PrintScreen();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          height: 70.h,
          width: 70.w,
          margin: REdgeInsets.symmetric(horizontal: 5),
          child: FloatingActionButton(
            backgroundColor: primaryBlue,
            onPressed: () {},
            child: Image.asset('assets/icons/camera_icon.png'),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }
}
