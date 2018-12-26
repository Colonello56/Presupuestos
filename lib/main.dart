import 'package:flutter/material.dart';
import 'presupuesto.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presupuestos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaPresupuestos(),
    );
  }
}

class ListaPresupuestos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PresupuestosState();
}

class PresupuestosState extends State<ListaPresupuestos> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Presupuestos'),
      ),
      body: _buildPresForm(),
    );
  }

  Widget _buildPresForm(){

    Presupuesto presup = new Presupuesto();

    return new Column(
      children: <Widget>[
        new RaisedButton(
          child: const Text('Generar'),
          onPressed: presup.generarPresupuesto()
        ),
      ],
    );

  }

}
