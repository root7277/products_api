import 'package:provider_state_managnment/resours/shorts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dataPath = await getApplicationDocumentsDirectory();
  Hive.init(dataPath.path);
  await Hive.openBox('myBox');
  runApp(
    MultiProvider(
      providers: [
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
      initialRoute: '/category',
      onGenerateRoute: (settings) => routsPage.getPage(settings),
    );
  }
}
