import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var numberList = [
    {"1", "13570808"},
    {"2", "13580808"}
  ];

  var current = 0;
  void incrementCounter() {
    current++;
    notifyListeners();
  }

  void decrementCounter() {
    current--;
    notifyListeners();
  }

  void addNumber() {
    numberList.add({current.toString(), DateTime.timestamp().toString()});
    notifyListeners();
  }

  List _items = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/ProductList.json');
    final data = await json.decode(response);
    _items = data["list"];
    notifyListeners();
  }

  var searchFil = "";
  bool isFavorite = false;
  var minPrice = "";
  var maxPrice = "";
  var minStock = 0;
  var maxStock = 99999999;
  var ratingFil = 0;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Products();
        break;
      case 1:
        page = Favorites();
        break;
      case 2:
        page = NumberControl();
        break;
      default:
        throw UnimplementedError('404');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(page.toString(),
              style: Theme.of(context).textTheme.titleLarge),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Row(
          children: [
            SafeArea(
                child: NavigationRail(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              extended: constraints.maxWidth >= 600,
              destinations: [
                NavigationRailDestination(
                    icon: Icon(Icons.calculate), label: Text("Home")),
                NavigationRailDestination(
                    icon: Icon(Icons.favorite), label: Text("favorite")),
                NavigationRailDestination(
                    icon: Icon(Icons.shop), label: Text("Products")),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            )),
            Expanded(child: page)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            appState.addNumber();
          },
          tooltip: 'Save',
          child: const Icon(Icons.save),
        ),
      );
    });
  }
}

class Favorites extends StatefulWidget {
  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Text("Favorites"),
        ),
        for (var number in appState.numberList)
          ListTile(
            leading: Text(number.elementAt(0)),
            title: Text(number.elementAt(1)),
          )
      ],
    );
  }
}

class NumberControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have clicked the button this many times:'),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  appState.current.toString(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: appState.decrementCounter, child: Text('-')),
              ElevatedButton(
                  onPressed: appState.incrementCounter, child: Text('+')),
            ],
          ),
        ],
      ),
    );
  }
}

class Products extends StatefulWidget {
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<MyAppState>().readJson();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search)),
                  onChanged: (value) {
                    appState.searchFil = value;
                    appState.readJson();
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return FilterForm();
                      });
                },
                child: Icon(Icons.filter_alt),
              ),
              ElevatedButton(
                onPressed: () {
                  appState.readJson();
                },
                child: Icon(Icons.refresh),
              )
            ],
          ),
        ),
        appState._items.isNotEmpty
            ? Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (9 / 16),
                    ),
                    itemCount: appState._items.length,
                    itemBuilder: (context, index) {
                      return (appState._items[index]["Name"]
                                  .toString()
                                  .toLowerCase()
                                  .contains(appState.searchFil)) &&
                              (!appState.isFavorite ||
                                  (appState.isFavorite &&
                                      appState._items[index]["Likes"] >= 40)) &&
                              ((appState.minPrice == "" ||
                                      appState.maxPrice == "") ||
                                  (int.tryParse(appState.minPrice) != null &&
                                      int.tryParse(appState.maxPrice) != null &&
                                      appState._items[index]["Price"] >=
                                          int.parse(appState.minPrice) &&
                                      appState._items[index]["Price"] <=
                                          int.parse(appState.maxPrice)))
                          ? ProductCard(index: index)
                          : const SizedBox();
                    }),
              )
            : const SizedBox()
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var productId = appState._items[index]["Id"];
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromARGB(21, 0, 0, 0),
            blurRadius: 0.02,
            spreadRadius: 0.2,
            offset: Offset(0, 4))
      ], borderRadius: BorderRadius.circular(12)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ProductDetail(productId: productId)));
        },
        child: Stack(children: [
          Card(
            clipBehavior: Clip.antiAlias,
            color: Theme.of(context).colorScheme.primaryContainer,
            key: ValueKey(appState._items[index]["Id"]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.memory(
                      base64Decode(appState._items[index]["Image"])),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Text(
                    "${appState._items[index]["Brand"]} - ${appState._items[index]["Name"]}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(
                    children: [
                      Text(
                        "\$",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Expanded(
                        child: Text(
                          appState._items[index]["Price"].toString(),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var i = 0;
                          i < appState._items[index]["Rating"].ceil();
                          i++)
                        Icon(
                          Icons.star,
                          size: 16,
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(appState._items[index]["Stock"].toString()),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          appState._items[index]["Likes"] >= 40
              ? Positioned(
                  right: 16,
                  top: 16,
                  child: Icon(
                    Icons.favorite,
                    size: 32,
                    color: Theme.of(context).colorScheme.error,
                  ),
                )
              : const SizedBox()
        ]),
      ),
    );
  }
}

class FilterForm extends StatefulWidget {
  const FilterForm({
    super.key,
  });

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Dialog(
      child: Column(
        children: [
          Text("Filtererer"),
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Text("Price"),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'MIN',
                        ),
                        onChanged: (value) {
                          appState.minPrice = value;
                          appState.readJson();
                        },
                      ),
                    ),
                    Text(" - "),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'MAX',
                        ),
                        onChanged: (value) {
                          appState.maxPrice = value;
                          appState.readJson();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Checkbox(
                  value: appState.isFavorite,
                  onChanged: (value) {
                    setState(() {
                      appState.isFavorite = value!;
                      appState.readJson();
                    });
                  },
                ),
                Expanded(child: Text("Favorite"))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var selectedProduct =
        appState._items.firstWhere((element) => element["Id"] == productId);
    return Scaffold(
      appBar: AppBar(
          title: Text("Product Detail"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.memory(base64Decode(selectedProduct["Image"]))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  selectedProduct["Name"].toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  selectedProduct["Description"].toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (var i = 0; i < selectedProduct["Rating"].ceil(); i++)
                      Icon(
                        Icons.star,
                        size: 16,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(selectedProduct["Stock"].toString()),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Text(
                      "\$",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Expanded(
                      child: Text(
                        selectedProduct["Price"].toString(),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                    selectedProduct["Likes"] >= 40
                        ? Icon(
                            Icons.favorite,
                            color: Theme.of(context).colorScheme.error,
                            size: 32,
                          )
                        : const SizedBox()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  "Product Detail",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Text(
                      "Model :",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Expanded(
                      child: Text(
                        selectedProduct["Model"].toString(),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Text(
                      "Weight : ",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Expanded(
                      child: Text(
                        selectedProduct["Weight"].toString(),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Row(
                  children: [
                    Text(
                      "Dimension : ",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Expanded(
                      child: Text(
                        selectedProduct["Dimension"].toString(),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  "You Migth Like :",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (final item in appState._items.where((element) =>
                          element["Category"] == selectedProduct["Category"] &&
                          element["Id"] != selectedProduct["Id"]))
                        Card(
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child:
                                      Image.memory(base64Decode(item["Image"])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, left: 16, right: 16),
                                  child: Text(
                                    "${item["Brand"]} - ${item["Name"]}",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, bottom: 16),
                                  child: Row(
                                    children: [
                                      Text(
                                        "\$",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                      Text(
                                        item["Price"].toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Id - Name - Description - Rating - Category - Brand - Model - Price - Stock - Weight - Dimension - Likes
