import 'package:flutter/material.dart';
import 'package:pokedex_api/widget/backgrpund_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundW(),
          Positioned(
            top: 140,
            left: 50,
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent[200],
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(500, 500))),
                ),
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  'Pokedex API',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 30),
                      primary: Colors.deepPurpleAccent),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'pagePokedex', (route) => false);
                  },
                  child: const Text(
                    'Continuar',
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            ),
          ),
          const _ImageInicio(),
        ],
      ),
    );
  }
}

class _ImageInicio extends StatelessWidget {
  const _ImageInicio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 0,
      left: 50,
      child: Image(
        height: 700,
        width: 400,
        image: AssetImage('assets/img/pokemon1.png'),
      ),
    );
  }
}
