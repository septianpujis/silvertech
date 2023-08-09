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
          title: Text(page.toString()),
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
  List _items = [];
  String searchKey = "";

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/ProductList.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["list"];
    });
  }

  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    readJson();

    myController.addListener(() {
      searchKey = myController.text;
      readJson();
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  bool isFavorites = false;

  @override
  Widget build(BuildContext context) {
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
                        prefixIcon: Icon(Icons.search))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return FilterForm();
                        });
                  },
                  child: Icon(Icons.filter_alt),
                ),
              )
            ],
          ),
        ),
        _items.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return _items[index]["Name"]
                              .toString()
                              .toLowerCase()
                              .contains(searchKey)
                          ? Card(
                              key: ValueKey(_items[index]["Id"]),
                              margin: EdgeInsets.all(12),
                              child: ListTile(
                                leading: Text(_items[index]["Id"].toString()),
                                title: Text(_items[index]["Name"].toString()),
                                subtitle:
                                    Text(_items[index]["Likes"].toString()),
                              ),
                            )
                          : const SizedBox();
                    }),
              )
            : const SizedBox()
      ],
    );
  }
}

class FilterForm extends StatelessWidget {
  const FilterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                      ),
                    ),
                    Text(" - "),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'MAX',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Id - Name - Description - Rating - Category - Brand - Model - Price - Stock - Weight - Dimension - Likes

