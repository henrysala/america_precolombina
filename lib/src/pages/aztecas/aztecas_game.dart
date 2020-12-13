import 'dart:async';

import 'package:flutter/material.dart';

class AztecasJuegoPage extends StatefulWidget {
  @override
  _AztecasJuegoPageState createState() => _AztecasJuegoPageState();
}

class _AztecasJuegoPageState extends State<AztecasJuegoPage> {
  //Timer _timer;
  int _primero = -1;
  int _segundo = -2;
  int _clicks = 0;
  int _indexA = -1;
  int _indexB = -2;
  //AssetImage _imagen = new AssetImage('assets/aztecas_icon.jpg');
  List<AssetImage> _imagenes = [
    AssetImage('assets/aztecas_icon.jpg'),
    AssetImage('assets/aztecas_icon.jpg'),
    AssetImage('assets/aztecas_icon.jpg'),
    AssetImage('assets/aztecas_icon.jpg'),
    AssetImage('assets/aztecas_icon.jpg'),
    AssetImage('assets/aztecas_icon.jpg'),
    AssetImage('assets/aztecas_icon.jpg'),
    AssetImage('assets/aztecas_icon.jpg'),
    AssetImage('assets/aztecas_icon.jpg'),
    AssetImage('assets/aztecas_icon.jpg'),
    AssetImage('assets/aztecas_icon.jpg'),
    AssetImage('assets/aztecas_icon.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff305d05),
        title: Text('Puzle Azteca'),
      ),
      body: Center(
        child: _buildGrid(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.reset_tv),
        onPressed: _reiniciar,
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Alerta !!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('primero: $_primero segundo: $_segundo'),
                FlutterLogo(
                  size: 70.0,
                )
              ],
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Ok'),
              ),
            ],
          );
        });
  }

  Widget _buildGrid() => GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(12, desordenados),
      );

  List<int> desordenados = [4, 5, 3, 1, 2, 6, 4, 5, 3, 1, 2, 6];

  List<Container> _buildGridTileList(int count, List<int> arr) => List.generate(
        count,
        (i) => Container(
            width: 80,
            child: GestureDetector(
              onTap: () {
                //_showAlert(context);
                _voltear(i, desordenados[i]);
              },
              child: Container(
                  child: FadeInImage(
                fadeInDuration: Duration(milliseconds: 1),
                image: _imagenes[i],
                placeholder: AssetImage('assets/aztecas_icon.jpg'),
              )),
            )),
      );

  void _voltear(int i, int k) async {
    if (_clicks < 2) {
      _imagenes[i] = AssetImage('assets/aztecas_game/$k.jpg');
      setState(() {});
      _segundo = _primero;
      _primero = k;
      _indexB = _indexA;
      _indexA = i;
      if (_indexB != _indexA) {
        //
        _clicks++;
        if (_clicks == 2 && _primero == _segundo) {
          _showAlert(context);
          _primero = -1;
          _segundo = -2;
          _indexB = -2;
          _indexA = -1;
          _clicks = 0;
        } else if (_clicks == 2 && _primero != _segundo) {
          await tapando();
          _clicks = 0;
          _primero = -1;
          _segundo = -2;
          _indexB = -2;
          _indexA = -1;
          //
        }
      }
    }
  }

  Future<void> tapando() async {
    return Future.delayed(Duration(seconds: 1), () => {tapar()});
  }

  void tapar() {
    _imagenes[_indexA] = AssetImage('assets/aztecas_icon.jpg');
    _imagenes[_indexB] = AssetImage('assets/aztecas_icon.jpg');
    setState(() {});
  }

  void _reiniciar() {}
}
