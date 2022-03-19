import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:inventory/app/pages/form/binding.dart';
import 'package:inventory/app/pages/form/page.dart';
import 'package:inventory/app/pages/home/binding.dart';
import 'package:inventory/app/pages/home/page.dart';
import 'package:inventory/app/pages/printing/binding.dart';
import 'package:inventory/app/pages/printing/page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage<HomePage>(
      name: AppRoutes.initial,
      page: () => const HomePage(),
      binding: InitialBinding(),
    ),
    GetPage<FormPage>(
      name: AppRoutes.form,
      page: FormPage.new,
      binding: FormBinding(),
    ),
    GetPage<PrintingPage>(
      name: AppRoutes.printing,
      page: PrintingPage.new,
      binding: PrintingBinding(),
    ),
  ];
}
