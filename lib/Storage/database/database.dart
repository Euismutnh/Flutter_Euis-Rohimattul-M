import 'package:drift/drift.dart';

import 'login_data.dart';
import 'regis_data.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Logins, Registrations],
)
class AppDb extends _$AppDb {
  AppDb(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 14;
}
