import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:inventory/data/core/dto.dart';
import 'package:inventory/data/provider/app_database.dart';
import 'package:inventory/domain/core/failure.dart';
import 'package:inventory/domain/core/inventory_item.dart';
import 'package:inventory/domain/pages/form/repository.dart';

class FormRepository implements IFormRepository {
  FormRepository(this._db);

  final AppDatabase _db;

  @override
  Future<Either<Failure, Unit>> insertOnConflictUpdate({
    required InventoryItem item,
  }) async {
    try {
      await _db
          .into(_db.inventory)
          .insertOnConflictUpdate(InventoryCompanionX.fromDomain(item));
      return right(unit);
    } on Exception catch (e) {
      Get.log('addItem $e');
      return left(const Failure.unexpectedError());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteItem({required int id}) async {
    try {
      await _db.deleteItem(id: id);
      return right(unit);
    } on Exception catch (e) {
      Get.log('addItem $e');
      return left(const Failure.unexpectedError());
    }
  }
}
