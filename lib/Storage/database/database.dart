import 'dart:io';

// database.dart
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_project_euis/Storage/database/login_data.dart';
import 'package:flutter_project_euis/Storage/database/regis_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(
  tables: [Logins, Registrations],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  int get schemaVersion => 16;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
