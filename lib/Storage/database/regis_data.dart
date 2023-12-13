import 'package:drift/drift.dart';

@DataClassName('Registration')
class Registrations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text()();
  TextColumn get email => text().customConstraint('UNIQUE')();
  TextColumn get phone => text()();
  TextColumn get password => text()();
}
