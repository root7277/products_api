import 'package:provider_state_managnment/resours/shorts.dart';
import 'package:provider_state_managnment/ui/api.dart';
import 'package:provider_state_managnment/ui/provider_model/splash.dart';

class RoutsPage {
  Route getPage(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/second':
        return MaterialPageRoute(builder: (context) => const AddUser());
      case '/splash':
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case '/category':
        return MaterialPageRoute(builder: (context) => const CategoryPage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
