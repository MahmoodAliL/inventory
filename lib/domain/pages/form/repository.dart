import 'package:dartz/dartz.dart';
import 'package:inventory/domain/core/failure.dart';
import 'package:inventory/domain/core/inventory_item.dart';

abstract class IFormRepository {
  Future<Either<Failure, Unit>> insertOnConflictUpdate({
    required InventoryItem item,
  });

  Future<Either<Failure, Unit>> deleteItem({
    required int id,
  });
}
