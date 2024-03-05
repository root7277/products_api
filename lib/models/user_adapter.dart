import 'package:hive/hive.dart';
import 'package:provider_state_managnment/resours/shorts.dart';

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final name = reader.read() as String;
    final phone = reader.read() as int;
    return User(name: name, phone: phone);
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.name);
    writer.write(obj.phone);
  }
}
