import 'package:hive/hive.dart';

class User extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int phone;
  User({
    required this.name,
    required this.phone,
  });
}
