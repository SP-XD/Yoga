import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rootllyai/controllers/user_controller.dart';
import 'package:rootllyai/main_layout.dart';
import 'package:rootllyai/models/user.dart';
import 'package:rootllyai/pages/home_page.dart';
import 'package:rootllyai/pages/rehab_page.dart';
import 'package:rootllyai/responsive/responsive_layout.dart';

import 'controllers/user_controller.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [
        GetPage(name: '/', page: () => MyApp()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/rehab', page: () => RehabPage())
      ],
      home: const MainLayout(),
    );
  }
}
