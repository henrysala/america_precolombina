import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
//Propias
import 'package:america_precolombina/src/providers/menu_provider.dart';

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

  //tuve que crear este arreglo ya que de aquí se tomaran las imágenes para crear la cuadricula
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

  //este array tendra el orden en el que se mostraran las imagenes
  List<int> desordenados = [1, 6, 2, 5, 3, 4, 4, 5, 3, 1, 2, 6];

  //esta función cambia el orden de las imagenes en el array
  void _desordenar(List<int> arreglo) {
    var random = new Random();
    for (var i = arreglo.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);

      var temp = arreglo[i];
      arreglo[i] = arreglo[n];
      arreglo[n] = temp;
    }
  }

  //se obtiene la informacion que se mostrara en las alertas
  Future<List<dynamic>> llenarInfo() async {
    List<dynamic> info =
        await provider.loadData('data/aztecas_info.json', 'juego');
    return info;
  }

  //muestra una alerta con informacion de la imagen
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

  //Crea la grilla
  Widget _buildGrid() => GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(12, desordenados),
      );

  //genera la estructura de la cuadricula y las imagenes que la componen
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

  //esta funcion hace que las imagenes se "destapen" al clikearlas
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
          _primero = -1;
          _segundo = -2;
          _indexB = -2;
          _indexA = -1;
        }
      }
    } else if (_clicks < 2) {
      _showAlert(context, k);
    }
  }

  //demora un segundo que se vuelvan a tapar las imagenes
  Future<void> tapando() async {
    return Future.delayed(Duration(seconds: 1), () => {tapar()});
  }

  //vuelve a tapar las imagenes si no son pareja
  void tapar() {
    _imagenes[_indexA] = AssetImage('assets/aztecas_icon.jpg');
    _imagenes[_indexB] = AssetImage('assets/aztecas_icon.jpg');
    _clicks = 0;
    setState(() {});
  }

  //vuelve a tapar todas las imagenes y cambia el orden
  void _reiniciar() {
    for (int i = 0; i < _imagenes.length; i++) {
      _imagenes[i] = AssetImage('assets/aztecas_icon.jpg');
    }
    _desordenar(desordenados);
    setState(() {});
  }
}
