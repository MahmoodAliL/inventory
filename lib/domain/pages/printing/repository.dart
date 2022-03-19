import 'package:dartz/dartz.dart';
import 'package:inventory/domain/core/failure.dart';
import 'package:inventory/domain/pages/printing/inventory_printing_item.dart';

abstract class IPrintingRepository {
  Future<Either<Failure, List<InventoryPrintingItem>>> loadAllItems();
}
