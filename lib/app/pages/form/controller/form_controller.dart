import 'package:get/get.dart';
import 'package:inventory/domain/core/failure.dart';
import 'package:inventory/domain/core/inventory_item.dart';
import 'package:inventory/domain/pages/form/repository.dart';

class FormController extends GetxController {
  FormController(this._repository);

  final IFormRepository _repository;

  static FormController get to => Get.find();

  bool isEditing = false;
  InventoryItem item = InventoryItem.empty();

  @override
  void onInit() {
    if (Get.arguments != null) {
      item = Get.arguments as InventoryItem;
      isEditing = true;
      update();
    }
    super.onInit();
  }

  void onNameChanged(String value) {
    item = item.copyWith(name: value);
    update();
  }

  void onCountChanged(String value) {
    item = item.copyWith(count: int.tryParse(value) ?? 0);
    update();
  }

  void onPriceChanged(String value) {
    item = item.copyWith(price: double.tryParse(value) ?? 0);
    update();
  }

  Future<void> save() async {
    Get.log('save: $item');
    final either = await _repository.insertOnConflictUpdate(item: item);

    either.fold(
      showMessage,
      (_) => Get.back<dynamic>(),
    );
  }

  Future<void> deleteItem() async {
    final either = await _repository.deleteItem(id: item.id);
    either.fold(showMessage, (r) => Get.back<dynamic>(closeOverlays: true));
  }

  void showMessage(Failure failure) {
    failure.map(
      unexpectedError: (_) =>
          Get.snackbar('Failure', 'Unexpected Error ocurred'),
    );
  }
}
