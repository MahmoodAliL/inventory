import 'package:get/get.dart';
import 'package:inventory/domain/pages/printing/inventory_printing_item.dart';
import 'package:inventory/domain/pages/printing/repository.dart';

class PrintingControler {
  PrintingControler(this._repository);

  final IPrintingRepository _repository;
  static PrintingControler get to => Get.find();
  static const int _kItemsInEachPage = 29;

  Future<Map<int, List<InventoryPrintingItem>>> loadAllItems() async {
    final list = <int, List<InventoryPrintingItem>>{};
    final either = await _repository.loadAllItems();

    either.fold((l) => null, (goodsList) {
      var start = 0;
      var end = _kItemsInEachPage;
      var page = 1;
      while (end <= goodsList.length) {
        list[page] = goodsList.sublist(start, end);
        end += _kItemsInEachPage;
        start += _kItemsInEachPage;
        page++;
      }
      list[page] = goodsList.sublist(start, goodsList.length);
    });

    return list;
  }
}
