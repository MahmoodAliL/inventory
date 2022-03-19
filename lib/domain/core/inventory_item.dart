import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_item.freezed.dart';

@freezed
abstract class InventoryItem with _$InventoryItem {
  const factory InventoryItem({
    required int id,
    required String name,
    required int count,
  }) = _InventoryItem;

  factory InventoryItem.empty() => const InventoryItem(
        id: -1,
        name: '',
        count: 0,
      );
}
