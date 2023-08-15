import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class ColorConstant {
  static Color primary900 = Color(0xFF00527F);
  static Color primary800 = Color(0xFF006197);
  static Color primary700 = Color(0xFF006BA6);
  static Color primary600 = Color(0xFF0077B6);
  static Color primary500 = Color(0xFF008CBA);
  static Color primary400 = Color(0xFF00A7DD);
  static Color primary300 = Color(0xFF75C3F3);
  static Color primary200 = Color(0xFF8FCFF6);
  static Color primary100 = Color(0xFFC6E5F7);
  static Color primary050 = Color(0xFFE3F4FF);

  static Color neutral900 = Color(0xFF383D47);
  static Color neutral800 = Color(0xFF383D47);
  static Color neutral700 = Color(0xFF585D67);
  static Color neutral600 = Color(0xFF62666E);
  static Color neutral500 = Color(0xFF96999E);
  static Color neutral400 = Color(0xFFABADB1);
  static Color neutral300 = Color(0xFFD0D0D0);
  static Color neutral200 = Color(0xFFE6E3E3);
  static Color neutral150 = Color(0xFFF1F1F1);
  static Color neutral100 = Color(0xFFF5F5F5);
  static Color neutral000 = Color(0xFFFFFFFF);

  static LinearGradient gradient = LinearGradient(
      colors: [ColorConstant.primary900, ColorConstant.primary600]);
  static LinearGradient borderGradient = LinearGradient(
      colors: [Color.fromRGBO(0, 142, 186, 1), Color.fromRGBO(0, 85, 132, 1)]);
  static LinearGradient pressedButton = LinearGradient(
      colors: [ColorConstant.primary900, ColorConstant.primary900]);
}

enum TypographyType {
  pageTitle,
  pageSubTitle,
  sectionTitle,
  sectionSubTitle,
  bodyBlack,
  bodyGrey,
  bodyLightGrey,
  danger,
  boxKey,
  boxValue,
  tableHeader,
  cardTitle,
  dashboardTitle,
  dashboardSubtitle,
  dashboardDate,
}

// class CustomTypography extends StatelessWidget {
//   const CustomTypography({
//     Key? key,
//     required this.text,
//     this.type,
//     this.alignment,
//     this.textColor,
//     this.fontWeight = FontWeight.w400,
//     this.fontSize = 16,
//   }) : super(key: key);

//   final String text;
//   final TypographyType? type;
//   final TextAlign? alignment;
//   final Color? textColor;
//   final FontWeight fontWeight;
//   final double fontSize;

//   @override
//   Widget build(BuildContext context) {
//     final double deviceWidth = MediaQuery.of(context).size.width;

//     return Text(
//       text,
//       style: type == null
//           ? TextStyle(
//               color: textColor ?? Colors.black,
//               fontWeight: fontWeight,
//               fontSize: calcFontSize(fontSize, deviceWidth),
//               overflow: TextOverflow.ellipsis,
//             )
//           : getStyleFromType(type, deviceWidth, textColor),
//       textAlign: alignment ?? TextAlign.start,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ontegoTheme(),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }

  ThemeData ontegoTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: ColorConstant.primary900),
      useMaterial3: true,
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
    return LayoutBuilder(builder: (context, constraints) {
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title:
                Text("My app", style: Theme.of(context).textTheme.titleLarge),
            backgroundColor: ColorConstant.primary900,
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.color_lens), text: "Basic"),
              Tab(icon: Icon(Icons.shopping_basket), text: "Product"),
              Tab(icon: Icon(Icons.numbers), text: "Number"),
              Tab(icon: Icon(Icons.favorite_border_outlined), text: "Num Fav"),
            ]),
          ),
          body: TabBarView(children: [
            ThemeViewer(),
            Products(),
            NumberControl(),
            Favorites()
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              appState.addNumber();
            },
            tooltip: 'Save',
            child: const Icon(Icons.save),
          ),
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
                    overflow: TextOverflow.ellipsis,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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

class ThemeViewer extends StatefulWidget {
  const ThemeViewer({super.key});

  @override
  State<ThemeViewer> createState() => _ThemeViewerState();
}

class _ThemeViewerState extends State<ThemeViewer>
    with SingleTickerProviderStateMixin {
  bool? isBox = false;
  bool isSwitch = false;

  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(controller);
    // Rebuilding the screen when animation goes ahead
    controller.addListener(() {
      setState(() {});
    });

    // Repeat the animation after finish
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    var colorList = [
      Theme.of(context).colorScheme.background,
      Theme.of(context).colorScheme.onBackground,
      Theme.of(context).colorScheme.error,
      Theme.of(context).colorScheme.errorContainer,
      Theme.of(context).colorScheme.onError,
      Theme.of(context).colorScheme.onErrorContainer,
      Theme.of(context).colorScheme.inversePrimary,
      Theme.of(context).colorScheme.inverseSurface,
      Theme.of(context).colorScheme.onInverseSurface,
      Theme.of(context).colorScheme.outline,
      Theme.of(context).colorScheme.outlineVariant,
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.primaryContainer,
      Theme.of(context).colorScheme.onPrimary,
      Theme.of(context).colorScheme.onPrimaryContainer,
      Theme.of(context).colorScheme.scrim,
      Theme.of(context).colorScheme.secondary,
      Theme.of(context).colorScheme.secondaryContainer,
      Theme.of(context).colorScheme.onSecondary,
      Theme.of(context).colorScheme.onSecondaryContainer,
      Theme.of(context).colorScheme.shadow,
      Theme.of(context).colorScheme.surface,
      Theme.of(context).colorScheme.surfaceTint,
      Theme.of(context).colorScheme.surfaceVariant,
      Theme.of(context).colorScheme.onSurface,
      Theme.of(context).colorScheme.onSurfaceVariant,
      Theme.of(context).colorScheme.tertiary,
      Theme.of(context).colorScheme.tertiaryContainer,
      Theme.of(context).colorScheme.onTertiary,
      Theme.of(context).colorScheme.onTertiaryContainer,
    ];

    var fontSize = [
      Theme.of(context).textTheme.bodyLarge,
      Theme.of(context).textTheme.bodyMedium,
      Theme.of(context).textTheme.bodySmall,
      Theme.of(context).textTheme.headlineLarge,
      Theme.of(context).textTheme.headlineMedium,
      Theme.of(context).textTheme.headlineSmall,
      Theme.of(context).textTheme.titleLarge,
      Theme.of(context).textTheme.titleMedium,
      Theme.of(context).textTheme.titleSmall,
      Theme.of(context).textTheme.labelLarge,
      Theme.of(context).textTheme.labelMedium,
      Theme.of(context).textTheme.labelSmall,
      Theme.of(context).textTheme.displayLarge,
      Theme.of(context).textTheme.displayMedium,
      Theme.of(context).textTheme.displaySmall,
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Button Label"),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
          OntegoButton(),
          CheckboxListTile(
            title: Text("Checkbox list tile"),
            value: isBox,
            tristate: true,
            onChanged: (value) {
              setState(() {
                print(value);
                isBox = value;
              });
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                tristate: true,
                activeColor: Colors.amber,
                checkColor: Colors.brown,
                value: isBox,
                onChanged: (value) {
                  setState(() {
                    print(value);
                    isBox = value;
                  });
                },
              ),
              Text("Label Ontego"),
            ],
          ),
          Switch(
            inactiveThumbColor: ColorConstant.neutral000,
            inactiveTrackColor: ColorConstant.neutral500,
            value: isSwitch,
            onChanged: (value) {
              setState(() {
                isSwitch = value;
              });
            },
          ),
          SwitchListTile(
            title: Text("Switch Label"),
            value: isSwitch,
            onChanged: (value) {
              setState(() {
                isSwitch = value;
              });
            },
          ),
          Container(
            height: sizeAnimation.value,
            width: sizeAnimation.value,
            color: colorAnimation.value,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var item in colorList)
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: item,
                        ),
                        width: 64,
                        height: 64,
                        child: Text(
                          item.toString(),
                        )),
                ],
              ),
            ),
          ),
          for (int i = 0; i < fontSize.length; i++)
            i % 3 != 2
                ? Text(
                    "Lorem Ipsum",
                    style: fontSize[i],
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Lorem Ipsum",
                      style: fontSize[i],
                    ),
                  ),
        ],
      ),
    );
  }
}

class OntegoButton extends StatefulWidget {
  const OntegoButton({
    super.key,
  });

  @override
  State<OntegoButton> createState() => _OntegoButtonState();
}

class _OntegoButtonState extends State<OntegoButton>
    with SingleTickerProviderStateMixin {
  var currentState = "normal";
  @override
  Widget build(BuildContext context) {
    Gradient getGradient(Set<MaterialState> states) {
      const Set<MaterialState> hovered = <MaterialState>{
        MaterialState.hovered,
        MaterialState.focused,
      };
      const Set<MaterialState> pressed = <MaterialState>{
        MaterialState.pressed,
      };

      if (states.any(hovered.contains)) {
        return ColorConstant.gradient;
      }

      if (states.any(pressed.contains)) {
        return ColorConstant.pressedButton;
      }
      return ColorConstant.borderGradient;
    }

    return SizedBox(
      width: 208,
      child: InkWell(
        statesController: MaterialStatesController(),
        onHover: (value) {
          setState(() {
            value ? currentState = "hover" : currentState = "normal";
          });
        },
        onTap: () {
          setState(() {
            currentState = "pressed";
          });
        },
        child: Material(
          child: Container(
            decoration: BoxDecoration(
              gradient: currentState == "normal"
                  ? ColorConstant.borderGradient
                  : currentState == "pressed"
                      ? ColorConstant.pressedButton
                      : ColorConstant.gradient,
            ),
            padding: EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                color: currentState == "normal"
                    ? ColorConstant.neutral000
                    : Color.fromRGBO(0, 0, 0, 0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 7,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Button $currentState",
                    style: TextStyle(
                      color: currentState == "normal"
                          ? ColorConstant.primary500
                          : ColorConstant.neutral000,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Icon(
                      Icons.arrow_forward,
                      color: currentState == "normal"
                          ? ColorConstant.primary500
                          : ColorConstant.neutral000,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
