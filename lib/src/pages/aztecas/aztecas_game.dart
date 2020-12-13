import 'dart:async';
//import 'dart:convert';

import 'package:america_precolombina/src/providers/menu_provider.dart';
//import 'package:america_precolombina/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

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

  //Future List<dynamic> info;

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
        child: Icon(Icons.autorenew),
        onPressed: _reiniciar,
      ),
    );
  }

/*   Widget sacarInfo() {
    return FutureBuilder(
      future: cardProvider.loadData('data/aztecas_info.json', 'juegos'),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return _listaItems(snapshot.data, context);
      },
    );
  }
  List<dynamic> _listaItems(List<dynamic> data, BuildContext context) */

  Future<List<dynamic>> llenarInfo() async {
    List<dynamic> info =
        await cardProvider.loadData('data/aztecas_info.json', 'juego');
    return info;
  }

/*   Future<List<dynamic>> loadData(String file, String data) async {
    final resp = await rootBundle.loadString(file);

    Map dataJson = json.decode(resp);
    info = dataJson[data];

    return info;
  } */

  void _showAlert(BuildContext context, int k) async {
    List<dynamic> info = await llenarInfo();
    //await info = llenarInfo(info);
    showDialog(
        context: context,
        //barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text(info[k - 1]['titulo']),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(info[k - 1]['descripcion']),
              ],
            ),
            actions: [
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
    if (_clicks < 2 && _imagenes[i] == AssetImage('assets/aztecas_icon.jpg')) {
      _indexB = _indexA;
      _indexA = i;
      if (_indexB != _indexA &&
          _imagenes[_indexA] == AssetImage('assets/aztecas_icon.jpg') &&
          _imagenes[_indexA] == AssetImage('assets/aztecas_icon.jpg')) {
        _imagenes[i] = AssetImage('assets/aztecas_game/$k.jpg');
        _clicks++;
        _segundo = _primero;
        _primero = k;
        setState(() {});
        if (_clicks == 2 && _primero == _segundo) {
          //_showAlert(context);
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
    } else {
      _showAlert(context, k);
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

  void _reiniciar() {
    for (int i = 0; i < _imagenes.length; i++) {
      _imagenes[i] = AssetImage('assets/aztecas_icon.jpg');
    }
    setState(() {});
  }
}
