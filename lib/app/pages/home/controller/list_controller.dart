import 'dart:async';

import 'package:get/get.dart';
import 'package:inventory/domain/core/failure.dart';
import 'package:inventory/domain/core/inventory_item.dart';
import 'package:inventory/domain/pages/home/repository.dart';

class ListController extends GetxController
    with StateMixin<List<InventoryItem>> {
  ListController(this.repository);

  static ListController get to => Get.find();

  final IHomeRepository repository;
  StreamSubscription? _subscription;
  final _searchWord = ''.obs;

  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());
    _search(searchWord: '');

    super.onInit();
  }

  void _search({required String searchWord}) {
    final stream = repository.watchInventoryList(searchWord: searchWord);
    _subscription = stream.listen((either) {
      either.fold(
        _onFailure,
        _onSuccess,
      );
    });
  }

  void onSearchTextChanged(String word) {
    _searchWord.value = word;
    debounce(
      _searchWord,
      (_) {
        change(null, status: RxStatus.loading());
        _search(searchWord: _searchWord.value);
      },
      time: const Duration(
        milliseconds: 500,
      ),
    );
  }

  void _onFailure(Failure failure) {
    failure.map(
      unexpectedError: (_) {
        change(null, status: RxStatus.error('unexpected Error'));
      },
    );
  }

  void _onSuccess(List<InventoryItem> list) {
    if (list.isEmpty) {
      change(list, status: RxStatus.empty());
    } else {
      change(list, status: RxStatus.success());
    }
  }

  @override
  void onClose() {
    _subscription?.cancel();
    _searchWord.close();
    super.onClose();
  }
}
