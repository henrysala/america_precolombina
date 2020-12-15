import 'package:flutter/material.dart';

import 'package:america_precolombina/src/providers/menu_provider.dart';

class IncasGame extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Sopa de letras'),
            backgroundColor: Color(0xffba6323)),
        body: Text('XD'));
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
        crossAxisCount: 10,
        crossAxisSpacing: 4,
        children: _createButtons(data),
      );

  List<Widget> _createButtons(List<dynamic> data){
    final List<Widget> info = [];
    data.forEach((element) {
      final temp = _createButton(element);
      info.add(temp);
    });
    return info;
  }

  Widget _createButton(String char){
    return MaterialButton(
      minWidth: 10,
      height: 10,
      textColor: Colors.white,
      child: Text(char),
      padding: const EdgeInsets.all(10.0),);
  }

}