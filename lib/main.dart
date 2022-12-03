import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:schraubentool/data_protection_page.dart';
import 'package:schraubentool/impressum_page.dart';
import 'package:schraubentool/schraupentool_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Schraubentool',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SchraubentoolPage(),
        );
      }
    );
  }
}

