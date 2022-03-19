import 'package:dartz/dartz.dart';
import 'package:get/get_core/get_core.dart';
import 'package:inventory/data/core/dto.dart';
import 'package:inventory/data/provider/app_database.dart';
import 'package:inventory/domain/core/failure.dart';
import 'package:inventory/domain/core/inventory_item.dart';
import 'package:inventory/domain/pages/home/repository.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository(this.db);

  final AppDatabase db;

  @override
  Future<Either<Failure, Unit>> incrementItemCount({
    required int id,
    required int count,
  }) async {
    try {
      await db.incrementItemCount(id: id, itemCount: count);
      return right(unit);
    } catch (e) {
      Get.log(e.toString());
      return left(const Failure.unexpectedError());
    }
  }

  @override
  Stream<Either<Failure, List<InventoryItem>>> watchInventoryList({
    required String searchWord,
  }) async* {
    try {
      yield* db.inventoryList(search: '%$searchWord%').watch().map((list) {
        final inventoryList = list.map((item) => item.toDomain()).toList();
        return right(inventoryList);
      });
    } on Exception catch (e) {
      Get.log(e.toString());
      yield left(const Failure.unexpectedError());
    }
  }
}
