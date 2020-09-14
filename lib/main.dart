import 'package:Bacalar/pantalla1.dart';
import 'package:flutter/material.dart';
import 'package:Bacalar/pantalla2.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(MyApp());
}

//Clase principal de la app
class MyApp extends StatelessWidget {
  //variable para guardar el nombre de usuario
  final usuario = TextEditingController();
  String usu = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //propiedad que deshabilita la cintita de 'Debug'
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PaginaInicio(),
      //rutas para direcionar los botones
      initialRoute: '/',
      routes: {
        '/pantalla1': (context) => Pantalla1(),
        '/pantalla2': (context) => Pantalla2()
      },
    );
  }
}

//primera pantalla
class PaginaInicio extends StatefulWidget {
  @override
  _PaginaInicio createState() => new _PaginaInicio();
}

class _PaginaInicio extends State<PaginaInicio> {
  //variable para guardar el nombre de usuario
  final usuario = TextEditingController();
  String usu = '';

  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              //Aqui agregue el mundo, que es una animacion importada de Flare y tube que importar las dependencias en el archivo 'pubspec.yaml'
              child: FlareActor(
                //este es el documento de la animacion
                'images/WorldSpin.flr',
                //este es el nombre que le dio el autor a la animacion que escogí
                animation: 'roll',
                fit: BoxFit.fitWidth,
              ),
            ),
            //Titulo de la app
            Text('Weißer Strand',
                style: TextStyle(
                  fontSize: 30.0,
                  height: 3.0,
                  color: Colors.black,
                )),
            Container(
              width: 500.0,
              padding: EdgeInsets.all(15),
              child: TextField(
                cursorColor: Colors.red,
                controller: usuario,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingrese su nombre',
                ),
              ),
            ),
            RaisedButton(
              child: Text("ACCEDER"),
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                  //esto es para redondear el boton
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )),
              onPressed: () {
                //declaro una variable para almacenar el nombre
                usu = usuario.text;

                //condicional para permitir el acceso
                if (usu != '') {
                  Navigator.pushNamed(context, '/pantalla1',
                      arguments: {'usuario': usu});
                } else {
                  //esta es la alerta para que el usuario cumpla con los requisitos
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Debe ingresar un usuario',
                            style: TextStyle(color: Colors.red),
                          ),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'))
                          ],
                        );
                      });
                }
                usuario.text = '';
              },
            )
          ],
        ),
      ),
    );
  }
}
