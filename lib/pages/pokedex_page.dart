import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex_api/widget/backgrpund_widget.dart';
import 'package:http/http.dart' as http;

class PokedexPage extends StatefulWidget {
  PokedexPage({Key? key}) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List? pokedexkanto;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

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
            itemCount: pokedexkanto?.length,
            itemBuilder: (context, index) => Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(62, 66, 107, 0.9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                            Text(
                              '${pokedexkanto?[index]['num']}' ?? 'N/D',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
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
                        Text(
                          pokedexkanto![index]['name'] ?? 'N/D',
                          style: const TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
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
                ),
                Positioned(
                  left: 200,
                  bottom: 100,
                  child: FadeInImage(
                    height: 300,
                    width: 300,
                    placeholder: const AssetImage(
                      'assets/img/pokemon1.png',
                    ),
                    image: NetworkImage(
                        pokedexkanto?[index] != null
                            ? pokedexkanto![index]['img']
                            : const AssetImage(
                                'assets/img/pokemon1.png',
                              ),
                        scale: 0.5),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void fetchPokemonData() async {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    await http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokedexkanto = decodedJsonData['pokemon'];
        setState(() {});
      } else {}
    });
  }
}


  //Funcion para llamar datos de pokemon


