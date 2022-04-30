import 'package:drift/drift.dart';
import 'package:inventory/data/provider/app_database.dart';
import 'package:inventory/domain/core/inventory_item.dart';
import 'package:inventory/domain/pages/printing/inventory_printing_item.dart';

extension InventoryCompanionX on InventoryData {
  InventoryPrintingItem toPrinting() {
    return InventoryPrintingItem(
      name: itemName,
      count: itemCount,
      price: itemPrice,
      totalPrice: itemCount * itemPrice,
    );
  }

  InventoryItem toDomain() {
    return InventoryItem(
      id: id,
      name: itemName,
      count: itemCount,
      price: itemPrice,
    );
  }

  static InventoryCompanion fromDomain(InventoryItem item) {
    return InventoryCompanion.insert(
      id: item.id == -1 ? const Value.absent() : Value(item.id),
      itemName: item.name,
      itemCount: item.count,
      itemPrice: item.price,
    );
  }
}
