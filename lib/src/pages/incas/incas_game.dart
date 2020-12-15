import 'package:flutter/material.dart';

import 'package:america_precolombina/src/providers/menu_provider.dart';

class IncasGame extends StatefulWidget{
  @override
  _IncasGameState createState() => _IncasGameState();
}

class _IncasGameState extends State<IncasGame> {

  bool pressed = false;
  List<String> letras = ["K", "A", "H", "P", "F", "J", "Y", "S", "K", "Z", "B", "V", "Q", "U", "A", "A", "A", "Y", "L", "L", "U", "M", "K", "L", "I", "C", "Q", "A", "L", "I", "W", "I", "C", "T", "L", "R", "H", "T", "E", "C", "S", "B", "Q", "Ñ", "O", "A", "A", "A", "S", "A", "C", "A", "R", "U", "C", "V", "S", "C", "C", "C", "R", "H", "Ñ", "S", "N", "V", "Z", "Q", "O", "U", "V", "Z", "I", "X", "Z", "I", "A", "E", "A", "C", "T", "E", "J", "T", "V", "F", "C", "P", "J", "B", "H", "E", "D", "S", "N", "D", "W", "R", "Y", "I", "J", "A", "C", "Q", "P", "I", "G", "S", "T", "K", "A", "V", "H", "M", "Z", "Z", "X", "R", "Y", "S", "X"];
  List<String> palabras = ["Pachacútec", "Pisac", "Ayllu", "Wilaq", "Aqllasqa", "Huiracocha", "Inti"];
  List<int> ids = [-1, 4, 5, 0, -1, -1, -1, -1, -1, -1, -1,-1, 4, 5, 0, -1, 2, 2, 2, 2, 2, -1,-1, 4, 5, 0, 3, 3, 3, 3, 3, -1, -1,-1, 4, 5, 0, -1, -1, 1, -1, -1, -1, -1,-1, 4, 5, 0, -1, -1, -1, 1, -1, -1, -1,-1, 4, 5, 0, -1, -1, -1, -1, 1, -1, -1,-1, 4, 5, 0, -1, -1, 6, -1, -1, 1, -1,-1, 4, 5, 0, -1, -1, 6, -1, -1, -1, 1,-1, -1, 5, 0, -1, -1, 6, -1, -1, -1, -1,-1, -1, 5, 0, -1, -1, 6, -1, -1, -1, -1,-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
  List<int> counters = List.filled(7, 0);
  List<bool> palabrasState =  List.filled(7, false);
  List<bool> buttonsState = List.filled(121, false);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Sopa de letras'),
            backgroundColor: Color(0xffba6323)),
        body: _wordSearchPuzzle());
  }

  
  Widget _wordSearchPuzzle() {
    final List<Widget> info = [];
    final card = Card(
      elevation: 20.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: [
            Expanded( child:_buildGrid()),
            _wordsList()
          ],
        ));
        info.add(card);

    return card;
  }

  Widget _buildGrid() => GridView.count(
        padding: const EdgeInsets.all(4),
        crossAxisCount: 11,
        children: _createButtons(),
      );

  List<Widget> _createButtons(){
    final List<Widget> info = [];
    int count = 0;
    letras.forEach((element) {
      final temp = _createButton(element, count);
      count++;
      info.add(temp);
    });
    return info;
  }

  Widget _createButton(String char, int id){
    return MaterialButton(
      minWidth: 10,
      height: 10,
      onPressed: () => {
                setState(() {
                  buttonsState[id] = !buttonsState[id];
                  VerifyCompletation();
                  if(ids[id] != -1){
                    counters[ids[id]]++;
                  }
                  
                  })
      },
      color: buttonsState[id] ? Colors.blue : Colors.white,
      textColor: Colors.black,
      child: Text(char),
      padding: const EdgeInsets.all(10.0),);
  }

  Widget _wordsList(){
        return Center(
          child: Card(
      elevation: 20.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          width: 350,
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _createWords()
        )
    )));
  }

  List<Widget> _createWords(){
    final List<Widget> list = [];
    int cont = 0;
    palabras.forEach((element) {
      Widget temp = Text(element, style: TextStyle(color: palabrasState[cont]? Colors.red : Colors.black),);
      cont++;
      list.add(temp);
    });
    return list;
  }

  void VerifyCompletation(){
    if(counters[0] == 10){
      palabrasState[0] == true;
    }
    if(counters[1] == 5){
      palabrasState[1] == true;
    }
    if(counters[2] == 5){
      palabrasState[2] == true;
    }
    if(counters[3] == 6){
      palabrasState[3] == true;
    }
    if(counters[4] == 8){
      palabrasState[4] == true;
    }
    if(counters[5] == 10){
      palabrasState[5] == true;
    }
    if(counters[6] == 4){
      palabrasState[6] == true;
    }
  }

}