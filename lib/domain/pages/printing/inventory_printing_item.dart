import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_printing_item.freezed.dart';

@freezed
abstract class InventoryPrintingItem with _$InventoryPrintingItem {
  const factory InventoryPrintingItem({
    required String name,
    required int count,
  }) = _InventoryPrintingItem;
}
