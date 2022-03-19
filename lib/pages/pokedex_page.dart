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
        body: Stack(
      children: [
        const BackgroundW(),
        ListView.builder(
            itemCount: pokedexkanto?.length,
            itemBuilder: (context, index) {
              var tipo = pokedexkanto?[index]['type'][0];
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: tipo == 'Grass'
                          ? const Color.fromRGBO(43, 209, 171, 1)
                          : tipo == 'Fire'
                              ? Colors.redAccent
                              : tipo == 'Water'
                                  ? Colors.blue
                                  : tipo == 'Electric'
                                      ? Color.fromARGB(255, 230, 209, 20)
                                      : tipo == 'Rock'
                                          ? Colors.grey
                                          : tipo == 'Ground'
                                              ? Colors.brown
                                              : tipo == 'Psychic'
                                                  ? Colors.indigo
                                                  : tipo == 'Fighting'
                                                      ? Colors.orange
                                                      : tipo == 'Bug'
                                                          ? const Color
                                                                  .fromARGB(
                                                              255, 9, 199, 57)
                                                          : tipo == 'Ghost'
                                                              ? Colors
                                                                  .deepPurple
                                                              : tipo == 'Normal'
                                                                  ? const Color
                                                                          .fromRGBO(
                                                                      233,
                                                                      100,
                                                                      100,
                                                                      1)
                                                                  : tipo ==
                                                                          'Posion'
                                                                      ? Colors
                                                                          .purple
                                                                      : Colors
                                                                          .purple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: const EdgeInsets.only(right: 30, top: 50, left: 30),
                    height: 320,
                    width: double.infinity,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 15, left: 15),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.personal_video,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '#${pokedexkanto?[index]['num']}',
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          Row(
                            children: [
                              Text(
                                pokedexkanto?[index]['name'] ?? 'N/D',
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 241, 201, 56),
                                size: 40,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Height : ${pokedexkanto?[index]['height']} ',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Weight : ${pokedexkanto?[index]['weight']} ',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50.0,
                            child: RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: const EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 91, 58, 240),
                                        Color.fromARGB(255, 58, 39, 141)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      maxWidth: 100.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${pokedexkanto?[index]['type'][0]}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 270,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: tipo == 'Grass'
                              ? const Color.fromRGBO(105, 240, 174, 0.9)
                              : tipo == 'Fire'
                                  ? const Color.fromARGB(255, 241, 48, 48)
                                  : tipo == 'Water'
                                      ? const Color.fromARGB(255, 23, 113, 187)
                                      : tipo == 'Electric'
                                          ? const Color.fromARGB(
                                              255, 156, 142, 12)
                                          : tipo == 'Rock'
                                              ? const Color.fromARGB(
                                                  255, 85, 80, 80)
                                              : tipo == 'Ground'
                                                  ? const Color.fromARGB(
                                                      255, 77, 50, 40)
                                                  : tipo == 'Psychic'
                                                      ? const Color.fromARGB(
                                                          255, 35, 56, 175)
                                                      : tipo == 'Fighting'
                                                          ? const Color
                                                                  .fromARGB(
                                                              255, 248, 134, 3)
                                                          : tipo == 'Bug'
                                                              ? Colors
                                                                  .lightGreenAccent
                                                              : tipo == 'Ghost'
                                                                  ? Colors
                                                                      .deepPurple
                                                                  : tipo ==
                                                                          'Normal'
                                                                      ? Colors
                                                                          .black26
                                                                      : tipo ==
                                                                              'Posion'
                                                                          ? const Color.fromARGB(
                                                                              255,
                                                                              209,
                                                                              17,
                                                                              243)
                                                                          : const Color.fromARGB(
                                                                              255,
                                                                              137,
                                                                              19,
                                                                              158),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                  Positioned(
                    left: 200,
                    bottom: 100,
                    child: FadeInImage(
                      height: 300,
                      width: 300,
                      placeholder: const AssetImage(
                        'assets/img/ashtrans.png',
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
              );
            })
      ],
    ));
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


