import 'package:drift/drift.dart';

@DataClassName('Login')
class Logins extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text().customConstraint('UNIQUE')();
  TextColumn get password => text()();
}
