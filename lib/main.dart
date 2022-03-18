import 'package:flutter/material.dart';
import 'package:pokedex_api/pages/pokedex_page.dart';
import 'package:pokedex_api/pages/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'pageInicio',
      routes: {
        'pageInicio': (BuildContext context) => WelcomePage(),
        'pagePokedex': (BuildContext context) => PokedexPage(),
      },
    );
  }
}
