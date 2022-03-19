import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:inventory/app/core/theme/theme.dart';
import 'package:inventory/app/pages/home/binding.dart';
import 'package:inventory/app/pages/home/page.dart';
import 'package:inventory/app/pages/printing/page.dart';
import 'package:inventory/app/routes/app_pages.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (_) => const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: AppRoutes.initial,
      initialBinding: InitialBinding(),
      getPages: AppPages.pages,
    );
  }
}
