import 'package:get/get.dart';
import 'package:inventory/app/pages/printing/controller/printing_controler.dart';
import 'package:inventory/data/pages/printing/repository.dart';
import 'package:inventory/domain/pages/printing/repository.dart';

class PrintingBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IPrintingRepository>(() => PrintingRepository(Get.find()))
      ..lazyPut<PrintingControler>(() => PrintingControler(Get.find()));
  }
}
