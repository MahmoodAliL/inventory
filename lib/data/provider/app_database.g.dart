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
  InventoryData(
      {required this.id, required this.itemName, required this.itemCount});
  factory InventoryData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return InventoryData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      itemName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item_name'])!,
      itemCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item_count'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_name'] = Variable<String>(itemName);
    map['item_count'] = Variable<int>(itemCount);
    return map;
  }

  InventoryCompanion toCompanion(bool nullToAbsent) {
    return InventoryCompanion(
      id: Value(id),
      itemName: Value(itemName),
      itemCount: Value(itemCount),
    );
  }

  factory InventoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryData(
      id: serializer.fromJson<int>(json['id']),
      itemName: serializer.fromJson<String>(json['item_name']),
      itemCount: serializer.fromJson<int>(json['item_count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'item_name': serializer.toJson<String>(itemName),
      'item_count': serializer.toJson<int>(itemCount),
    };
  }

  InventoryData copyWith({int? id, String? itemName, int? itemCount}) =>
      InventoryData(
        id: id ?? this.id,
        itemName: itemName ?? this.itemName,
        itemCount: itemCount ?? this.itemCount,
      );
  @override
  String toString() {
    return (StringBuffer('InventoryData(')
          ..write('id: $id, ')
          ..write('itemName: $itemName, ')
          ..write('itemCount: $itemCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemName, itemCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryData &&
          other.id == this.id &&
          other.itemName == this.itemName &&
          other.itemCount == this.itemCount);
}

class InventoryCompanion extends UpdateCompanion<InventoryData> {
  final Value<int> id;
  final Value<String> itemName;
  final Value<int> itemCount;
  const InventoryCompanion({
    this.id = const Value.absent(),
    this.itemName = const Value.absent(),
    this.itemCount = const Value.absent(),
  });
  InventoryCompanion.insert({
    this.id = const Value.absent(),
    required String itemName,
    required int itemCount,
  })  : itemName = Value(itemName),
        itemCount = Value(itemCount);
  static Insertable<InventoryData> custom({
    Expression<int>? id,
    Expression<String>? itemName,
    Expression<int>? itemCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemName != null) 'item_name': itemName,
      if (itemCount != null) 'item_count': itemCount,
    });
  }

  InventoryCompanion copyWith(
      {Value<int>? id, Value<String>? itemName, Value<int>? itemCount}) {
    return InventoryCompanion(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      itemCount: itemCount ?? this.itemCount,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryCompanion(')
          ..write('id: $id, ')
          ..write('itemName: $itemName, ')
          ..write('itemCount: $itemCount')
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
  @override
  List<GeneratedColumn> get $columns => [id, itemName, itemCount];
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
        'SELECT\r\n    *\r\nFROM\r\n    inventory\r\nORDER BY\r\n    id DESC',
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
        'SELECT\r\n    *\r\nFROM\r\n    inventory\r\nWHERE\r\n    item_name LIKE :search\r\nORDER BY\r\n    id DESC\r\nLIMIT\r\n    20',
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

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [inventory, inventoryItemName];
}
