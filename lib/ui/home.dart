import 'package:hive/hive.dart';
import 'package:provider_state_managnment/resours/shorts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final myBox = Hive.box('myBox');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColors,
        title: Text('Home Page', style: AppStyles.getAppBarStyles()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: myBox.values.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(
                  myBox.values.toList()[index],
                  style: AppStyles.getAppBarStyles().copyWith(color: Colors.black),
                ),
                trailing: IconButton(
                    onPressed: () {
                      setState(() {});
                      myBox.deleteAt(index);
                    },
                    icon: const Icon(Icons.cancel)),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            myBox.add(name.text);
            name.clear();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
