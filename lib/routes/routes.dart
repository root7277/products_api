import 'package:provider_state_managnment/resours/shorts.dart';
import 'package:provider_state_managnment/ui/api.dart';
import 'package:provider_state_managnment/ui/provider_model/splash.dart';

abstract class RouteName {
  static const String homeScreen = '/';
  static const String splash = '/splash';
  static const String second = '/second';
  static const String category = '/category';
}

class RoutsPage {
  Route getPage(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RouteName.second:
        return MaterialPageRoute(builder: (context) => const AddUser());
      case RouteName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteName.category:
        return MaterialPageRoute(builder: (context) => const CategoryPage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
