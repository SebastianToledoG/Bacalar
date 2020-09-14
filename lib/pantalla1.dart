import 'package:flutter/material.dart';

class Pantalla1 extends StatefulWidget {
  @override
  _Pantalla1 createState() => new _Pantalla1();
}

class _Pantalla1 extends State<Pantalla1> {
  Widget build(BuildContext context) {
    //aqui declaro que puedo usar rutas para moberme entre pantallas
    Map parametros = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
        appBar: AppBar(
          // aqui ocupo el parametro del usuario tomado en la pantalla anterior
          title: Text('Bienvenido/a ' + parametros['usuario']),
        ),
        //aqui pongo un medu lateral
        drawer: MenuLateral(),
        //este es un boton para agregar fotos
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      '¿Desea agregar una imagen?',
                      style: TextStyle(color: Colors.amber),
                    ),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Próximamente podrá',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Vale'))
                                    ],
                                  );
                                });
                          },
                          child: Text('Sí, porfa')),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('La neta no')),
                    ],
                  );
                });
          },
          child: Icon(Icons.add_circle),
        ),
        body: Center(
          // aqui agrego una lista de fotos
          child: lista(),
        ));
  }
}

//esta es la clase para el menu lateral
class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountEmail: Text(''),
            accountName: Text('Bienvenidos al Himalaya'),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/fondomadera.jpg'),
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}

Widget lista() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      //estas son variables que declare, donde hay un link de una paguina que importa fotos random
      final url = 'https://picsum.photos/seed/picsum/700/700';
      final urlSecond = 'https://picsum.photos/seed/picsum/600/400';

      return InkWell(
          onTap: () {
            //aqui redireciono a la segunda pantalla
            Navigator.of(context).pushNamed('/pantalla2', arguments: urlSecond);
          },
          child: Card(
            child: Container(
              width: 2,
              child: FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(url),
                //aqui agrege un gif para mostrar que esta cargando una imagen
                placeholder: AssetImage('images/GIFcargando.gif'),
                height: 500,
              ),
            ),
          ));
    },
  );
}
