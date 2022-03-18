import 'package:flutter/material.dart';

class BackgroundW extends StatelessWidget {
  const BackgroundW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      height: double.infinity,
      width: double.infinity,
      image: AssetImage('assets/img/bg01.png'),
      fit: BoxFit.cover,
    );
  }
}
