import 'package:flutter/material.dart';
import 'models/item.dart';
import 'package:flutter_qualif/variable.dart';
import 'package:flutter_qualif/views/pages/home.dart';
import 'package:flutter_qualif/views/pages/item_detail.dart';
import 'package:flutter_qualif/views/pages/items.dart';
import 'package:flutter_qualif/views/pages/login.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  void changeTheme() {
    setState(() {
      if (isDefaultTheme)
        isDefaultTheme = false;
      else
        isDefaultTheme = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDefaultTheme ? ThemeData.light() : ThemeData.dark(),
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(this.changeTheme),
        '/items': (context) => ItemPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ItemDetailPage.routeName) {
          final args = settings.arguments as Item;

          return MaterialPageRoute(builder: (context) {
            return ItemDetailPage(
              item: args,
            );
          });
        }
        // assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
