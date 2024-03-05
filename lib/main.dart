import 'package:provider_state_managnment/models/user_adapter.dart';
import 'package:provider_state_managnment/resours/shorts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider_state_managnment/ui/provider_model/second_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dataPath = await getApplicationDocumentsDirectory();
  Hive.init(dataPath.path);
  await Hive.openBox('myBox');
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox('user');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SecondProvider()),
        ChangeNotifierProvider(create: (context) => ProviderModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    RoutsPage routsPage = RoutsPage();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.homeScreen,
      onGenerateRoute: (settings) => routsPage.getPage(settings),
    );
  }
}
