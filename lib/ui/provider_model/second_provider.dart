import 'package:hive/hive.dart';
import 'package:provider_state_managnment/resours/shorts.dart';

class SecondProvider extends ChangeNotifier {
  final userData = Hive.box('user');

  void getAddUser(User user) {
    userData.add(user);
    notifyListeners();
  }
}
