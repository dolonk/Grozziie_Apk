import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/barcode_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/date_time_editing_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/text_editing_provider.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/created_label.dart';
import 'package:grozziieapk/presentation_layer/ui/login_section/splash_screen.dart';
import 'package:provider/provider.dart';
import 'domain_layer/resourcs/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [

            ChangeNotifierProvider<TextEditingProvider>(
              create: (_) => TextEditingProvider(),
            ),

            ChangeNotifierProvider<BarcodeProvider>(
              create: (_) => BarcodeProvider(),
            ),

            ChangeNotifierProvider<DateTimeProvider>(
              create: (_) => DateTimeProvider(),
            ),
          ],
          child: MaterialApp(
            title: 'Grozziie',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: child,
          ),
        );
      },
      child: const CreateLabel(),
    );
  }
}
