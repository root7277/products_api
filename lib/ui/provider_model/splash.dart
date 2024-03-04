import 'package:provider_state_managnment/resours/shorts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getSplash() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return Navigator.pushNamedAndRemoveUntil(context, RouteName.category, (route) => false);
    });
  }

  @override
  void initState() {
    getSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcom to my application',
          style: AppStyles.getAppBarStyles().copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
