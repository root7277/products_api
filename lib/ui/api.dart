import 'package:provider_state_managnment/resours/shorts.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Future getStart() async {
    await context.read<ProviderModel>().getAllCategory();
    await context.read<ProviderModel>().getAllProducts(context.read<ProviderModel>().category[0].toString());
  }

  @override
  void initState() {
    getStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ApiModels apiModels = ApiModels();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Category'),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 70,
              child: Consumer<ProviderModel>(
                builder: (context, value, child) {
                  if (value.category.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (value.category.isNotEmpty) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: value.category.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            value.products.clear();
                            value.getAllProducts(value.category[index].toString());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              value.category[index].toString(),
                              style: AppStyles.getCategoryStyle(),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Text('error');
                },
              )),
          Expanded(child: Consumer<ProviderModel>(
            builder: (context, value, child) {
              if (value.products.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (value.products.isNotEmpty) {
                return ListView.builder(
                  itemCount: value.products[0].products.length,
                  itemBuilder: (context, index) {
                    final product = value.products[0].products[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(product.id.toString()),
                      ),
                      title: Text(product.title),
                      subtitle: Text(product.description),
                    );
                  },
                );
              }
              return const SizedBox();
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<ProviderModel>().getAllCategory();
      }),
    );
  }
}
