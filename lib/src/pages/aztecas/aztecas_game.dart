import 'dart:async';
import 'dart:math';
import 'package:america_precolombina/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class AztecasJuegoPage extends StatefulWidget {
  @override
  _AztecasJuegoPageState createState() => _AztecasJuegoPageState();
}

class _AztecasJuegoPageState extends State<AztecasJuegoPage> {
  int _primero = -1;
  int _segundo = -2;
  int _clicks = 0;
  int _indexA = -1;
  int _indexB = -2;

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
        child: Icon(Icons.autorenew),
        onPressed: _reiniciar,
      ),
    );
  }

  Future<List<dynamic>> llenarInfo() async {
    List<dynamic> info =
        await provider.loadData('data/aztecas_info.json', 'juego');
    return info;
  }

  void _desordenar(List<int> arreglo) {
    var random = new Random();
    for (var i = arreglo.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);

      var temp = arreglo[i];
      arreglo[i] = arreglo[n];
      arreglo[n] = temp;
    }
  }

  List<int> desordenados = [4, 5, 3, 1, 2, 6, 4, 5, 3, 1, 2, 6];

  void _showAlert(BuildContext context, int k) async {
    List<dynamic> info = await llenarInfo();

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

  List<Container> _buildGridTileList(int count, List<int> arr) => List.generate(
        count,
        (i) => Container(
            width: 80,
            child: GestureDetector(
              onTap: () {
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
    _desordenar(desordenados);
    setState(() {});
  }
}
