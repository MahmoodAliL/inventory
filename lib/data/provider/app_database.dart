import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:get/get.dart' hide Value;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_windows/path_provider_windows.dart';

part 'app_database.g.dart';

const String _databaseName = 'db.sqlite';
const int _databaseVersion = 1;

@DriftDatabase(
  include: {
    'tables.moor',
    '../pages/home/sql.moor',
    '../pages/form/sql.moor',
    '../pages/printing/sql.moor',
  },
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => _databaseVersion;

  static Future<String> getDatabaseFolderPath() async {
    var dbFolderPath = '';
    if (GetPlatform.isDesktop) {
      final provider = PathProviderWindows();
      dbFolderPath = (await provider.getApplicationSupportPath())!;
    } else {
      final dbFolder = await getApplicationDocumentsDirectory();
      dbFolderPath = dbFolder.path;
    }

    return dbFolderPath;
  }

  Future<File> databaseFile() async {
    final dbFolderPath = await AppDatabase.getDatabaseFolderPath();
    final file = File(path.join(dbFolderPath, _databaseName));
    return file;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolderPath = await AppDatabase.getDatabaseFolderPath();
      final file = File(path.join(dbFolderPath, _databaseName));
      return NativeDatabase(file, logStatements: true);
    },
  );
}
