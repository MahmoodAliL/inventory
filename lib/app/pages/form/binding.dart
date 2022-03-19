import 'package:get/get.dart';
import 'package:inventory/app/pages/form/controller/form_controller.dart';
import 'package:inventory/data/pages/form/repository.dart';
import 'package:inventory/domain/pages/form/repository.dart';

class FormBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IFormRepository>(() => FormRepository(Get.find()))
      ..lazyPut<FormController>(() => FormController(Get.find()));
  }
}
