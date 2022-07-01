// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class InventoryData extends DataClass implements Insertable<InventoryData> {
  final int id;
  final String itemName;
  final int itemCount;
  final double itemPrice;
  InventoryData(
      {required this.id,
      required this.itemName,
      required this.itemCount,
      required this.itemPrice});
  factory InventoryData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return InventoryData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      itemName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item_name'])!,
      itemCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item_count'])!,
      itemPrice: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item_price'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_name'] = Variable<String>(itemName);
    map['item_count'] = Variable<int>(itemCount);
    map['item_price'] = Variable<double>(itemPrice);
    return map;
  }

  InventoryCompanion toCompanion(bool nullToAbsent) {
    return InventoryCompanion(
      id: Value(id),
      itemName: Value(itemName),
      itemCount: Value(itemCount),
      itemPrice: Value(itemPrice),
    );
  }

  factory InventoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryData(
      id: serializer.fromJson<int>(json['id']),
      itemName: serializer.fromJson<String>(json['item_name']),
      itemCount: serializer.fromJson<int>(json['item_count']),
      itemPrice: serializer.fromJson<double>(json['item_price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'item_name': serializer.toJson<String>(itemName),
      'item_count': serializer.toJson<int>(itemCount),
      'item_price': serializer.toJson<double>(itemPrice),
    };
  }

  InventoryData copyWith(
          {int? id, String? itemName, int? itemCount, double? itemPrice}) =>
      InventoryData(
        id: id ?? this.id,
        itemName: itemName ?? this.itemName,
        itemCount: itemCount ?? this.itemCount,
        itemPrice: itemPrice ?? this.itemPrice,
      );
  @override
  String toString() {
    return (StringBuffer('InventoryData(')
          ..write('id: $id, ')
          ..write('itemName: $itemName, ')
          ..write('itemCount: $itemCount, ')
          ..write('itemPrice: $itemPrice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemName, itemCount, itemPrice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryData &&
          other.id == this.id &&
          other.itemName == this.itemName &&
          other.itemCount == this.itemCount &&
          other.itemPrice == this.itemPrice);
}

class InventoryCompanion extends UpdateCompanion<InventoryData> {
  final Value<int> id;
  final Value<String> itemName;
  final Value<int> itemCount;
  final Value<double> itemPrice;
  const InventoryCompanion({
    this.id = const Value.absent(),
    this.itemName = const Value.absent(),
    this.itemCount = const Value.absent(),
    this.itemPrice = const Value.absent(),
  });
  InventoryCompanion.insert({
    this.id = const Value.absent(),
    required String itemName,
    required int itemCount,
    required double itemPrice,
  })  : itemName = Value(itemName),
        itemCount = Value(itemCount),
        itemPrice = Value(itemPrice);
  static Insertable<InventoryData> custom({
    Expression<int>? id,
    Expression<String>? itemName,
    Expression<int>? itemCount,
    Expression<double>? itemPrice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemName != null) 'item_name': itemName,
      if (itemCount != null) 'item_count': itemCount,
      if (itemPrice != null) 'item_price': itemPrice,
    });
  }

  InventoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? itemName,
      Value<int>? itemCount,
      Value<double>? itemPrice}) {
    return InventoryCompanion(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      itemCount: itemCount ?? this.itemCount,
      itemPrice: itemPrice ?? this.itemPrice,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    if (itemCount.present) {
      map['item_count'] = Variable<int>(itemCount.value);
    }
    if (itemPrice.present) {
      map['item_price'] = Variable<double>(itemPrice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryCompanion(')
          ..write('id: $id, ')
          ..write('itemName: $itemName, ')
          ..write('itemCount: $itemCount, ')
          ..write('itemPrice: $itemPrice')
          ..write(')'))
        .toString();
  }
}

class Inventory extends Table with TableInfo<Inventory, InventoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Inventory(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _itemNameMeta = const VerificationMeta('itemName');
  late final GeneratedColumn<String?> itemName = GeneratedColumn<String?>(
      'item_name', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _itemCountMeta = const VerificationMeta('itemCount');
  late final GeneratedColumn<int?> itemCount = GeneratedColumn<int?>(
      'item_count', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _itemPriceMeta = const VerificationMeta('itemPrice');
  late final GeneratedColumn<double?> itemPrice = GeneratedColumn<double?>(
      'item_price', aliasedName, false,
      type: const RealType(),
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, itemName, itemCount, itemPrice];
  @override
  String get aliasedName => _alias ?? 'inventory';
  @override
  String get actualTableName => 'inventory';
  @override
  VerificationContext validateIntegrity(Insertable<InventoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_name')) {
      context.handle(_itemNameMeta,
          itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta));
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    if (data.containsKey('item_count')) {
      context.handle(_itemCountMeta,
          itemCount.isAcceptableOrUnknown(data['item_count']!, _itemCountMeta));
    } else if (isInserting) {
      context.missing(_itemCountMeta);
    }
    if (data.containsKey('item_price')) {
      context.handle(_itemPriceMeta,
          itemPrice.isAcceptableOrUnknown(data['item_price']!, _itemPriceMeta));
    } else if (isInserting) {
      context.missing(_itemPriceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return InventoryData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Inventory createAlias(String alias) {
    return Inventory(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final Inventory inventory = Inventory(this);
  late final Index inventoryItemName = Index('inventory_item_name',
      'CREATE INDEX inventory_item_name ON inventory (item_name);');
  Selectable<InventoryData> allItemInInventory() {
    return customSelect(
        'SELECT\r\n    *\r\nFROM\r\n    inventory\r\nORDER BY\r\n    item_name',
        variables: [],
        readsFrom: {
          inventory,
        }).map(inventory.mapFromRow);
  }

  Future<int> deleteItem({required int id}) {
    return customUpdate(
      'DELETE FROM\r\n    inventory\r\nWHERE\r\n    id = :id',
      variables: [Variable<int>(id)],
      updates: {inventory},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<InventoryData> inventoryList({required String search}) {
    return customSelect(
        'SELECT\r\n    *\r\nFROM\r\n    inventory\r\nWHERE\r\n    item_name LIKE :search\r\nORDER BY\r\n    id DESC',
        variables: [
          Variable<String>(search)
        ],
        readsFrom: {
          inventory,
        }).map(inventory.mapFromRow);
  }

  Future<int> incrementItemCount({required int itemCount, required int id}) {
    return customUpdate(
      'UPDATE\r\n    inventory\r\nSET\r\n    item_count = item_count + :itemCount\r\nWHERE\r\n    id = :id',
      variables: [Variable<int>(itemCount), Variable<int>(id)],
      updates: {inventory},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> resetData() {
    return customUpdate(
      'DELETE FROM\r\n    inventory',
      variables: [],
      updates: {inventory},
      updateKind: UpdateKind.delete,
    );
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [inventory, inventoryItemName];
}
