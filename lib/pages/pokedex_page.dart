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
          const BackgroundW(),
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Stack(
              children: const [_carPokemon(), _imagenPokemon()],
            ),
          )
        ],
      ),
    );
  }
}

class _imagenPokemon extends StatelessWidget {
  const _imagenPokemon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 200,
      bottom: 100,
      child: Image(
        width: 300,
        image: AssetImage('assets/img/pokemon1.png'),
      ),
    );
  }
}

class _carPokemon extends StatelessWidget {
  const _carPokemon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(62, 66, 107, 0.9),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      height: 320,
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.only(top: 20, right: 5),
                  child: const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Num',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: const [
                Text(
                  'Habil',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 40,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'NombrePokemon',
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
              ),
            ),
            const Text(
              'PoderdeHabilidad',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () {},
              child: const Text(
                'Ver mas',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
