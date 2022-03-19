import 'package:get/get.dart';
import 'package:inventory/domain/core/validator.dart';
import 'package:inventory/domain/pages/home/repository.dart';

class DialogController extends GetxController {
  DialogController(this.repository);

  final IHomeRepository repository;
  static DialogController get to => Get.find();

  int _count = 0;
  String? errorMessage;

  void onItemCountChanged(String input) {
    errorMessage = FormFiledValidator.required(input);
    if (errorMessage == null) {
      _count = int.tryParse(input) ?? 0;
    }
    update();
  }

  Future<void> incrementItemCount({required int id}) async {
    final either = await repository.incrementItemCount(id: id, count: _count);
    either.fold(
      (failure) => errorMessage = 'Unexpected error occurs',
      (_) => Get.back<dynamic>(closeOverlays: true),
    );
  }
}
