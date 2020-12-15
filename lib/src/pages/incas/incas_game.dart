import 'package:flutter/material.dart';

import 'package:america_precolombina/src/providers/menu_provider.dart';

class IncasGame extends StatefulWidget{
  @override
  _IncasGameState createState() => _IncasGameState();
}

class _IncasGameState extends State<IncasGame> {

  bool pressed = false;
  List<bool> buttonsState = List.filled(121, false);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Sopa de letras'),
            backgroundColor: Color(0xffba6323)),
        body: _alphabetSoup());
  }

  Widget _alphabetSoup() {
    return FutureBuilder(
      future: provider.loadData('data/incas_info.json', 'letras'),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return _buildGrid(snapshot.data);
      },
    );
  }

  Widget _buildGrid(List<dynamic> data) => GridView.count(
        padding: const EdgeInsets.all(4),
        crossAxisCount: 11,
        children: _createButtons(data),
      );

  List<Widget> _createButtons(List<dynamic> data){
    final List<Widget> info = [];
    int count = 0;
    data.forEach((element) {
      final temp = _createButton(element, count);
      count++;
      info.add(temp);
    });
    return info;
  }

  Color _getColor(){
    if(pressed){
      return Colors.red;
    }
    else {
      Colors.white;
    }
  }

  Widget _createButton(String char, int id){
    return MaterialButton(
      minWidth: 10,
      height: 10,
      onPressed: () => {
                setState(() {
                  buttonsState[id] = !buttonsState[id];
                  })
      },
      color: buttonsState[id] ? Colors.blue : Colors.white,
      textColor: Colors.black,
      child: Text(char),
      padding: const EdgeInsets.all(10.0),);
  }

}