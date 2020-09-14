import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Tu imagen')),
      //aqui intente poner una animacion de trancicion entre pantallas llamada 'Hero'
      body: Center(child: Hero(tag: url, child: Image.network(url))),
    );
  }
}
