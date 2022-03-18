import 'package:flutter/material.dart';
import 'package:pokedex_api/widget/backgrpund_widget.dart';

class PokedexPage extends StatefulWidget {
  PokedexPage({Key? key}) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        backgroundColor: Colors.deepPurpleAccent[100],
      ),
      body: Stack(
        children: [
          BackgroundW(),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.9),
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            height: 300,
            width: double.infinity,
            child: Column(),
          )
        ],
      ),
    );
  }
}
