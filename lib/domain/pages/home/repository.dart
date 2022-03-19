import 'package:dartz/dartz.dart';
import 'package:inventory/domain/core/failure.dart';
import 'package:inventory/domain/core/inventory_item.dart';

abstract class IHomeRepository {
  Stream<Either<Failure, List<InventoryItem>>> watchInventoryList({
    required String searchWord,
  });
  Future<Either<Failure, Unit>> incrementItemCount({
    required int id,
    required int count,
  });
}
