import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:inventory/data/core/dto.dart';
import 'package:inventory/data/provider/app_database.dart';
import 'package:inventory/domain/core/failure.dart';
import 'package:inventory/domain/pages/printing/inventory_printing_item.dart';
import 'package:inventory/domain/pages/printing/repository.dart';

class PrintingRepository implements IPrintingRepository {
  PrintingRepository(this._db);

  final AppDatabase _db;

  @override
  Future<Either<Failure, List<InventoryPrintingItem>>> loadAllItems() async {
    try {
      final result = await _db.allItemInInventory().get();
      final list = result.map((e) => e.toPrinting()).toList();
      return right(list);
    } on Exception catch (e) {
      Get.log('loadAllItems: $e');
      return left(const Failure.unexpectedError());
    }
  }
}
