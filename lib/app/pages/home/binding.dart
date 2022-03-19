import 'package:get/get.dart';
import 'package:inventory/app/pages/home/controller/list_controller.dart';
import 'package:inventory/data/pages/home/repository.dart';
import 'package:inventory/data/provider/app_database.dart';
import 'package:inventory/domain/pages/home/repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(AppDatabase.new)
      ..lazyPut<IHomeRepository>(() => HomeRepository(Get.find()))
      ..lazyPut(() => ListController(Get.find()));
  }
}
