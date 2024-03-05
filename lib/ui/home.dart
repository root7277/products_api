import 'package:provider_state_managnment/resours/shorts.dart';
import 'package:provider_state_managnment/ui/provider_model/second_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColors,
        title: Text('Home Page', style: AppStyles.getAppBarStyles()),
      ),
      body: Consumer<SecondProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.userData.values.length,
            itemBuilder: (context, index) {
              List<User> data = value.userData.values.toList().cast();
              return ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(
                  data[index].name,
                  style: AppStyles.getAppBarStyles().copyWith(color: Colors.black),
                ),
                subtitle: Text(data[index].phone.toString()),
                trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.cancel)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteName.second);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
