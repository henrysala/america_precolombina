import 'package:flutter/material.dart';

//Propias
import 'package:america_precolombina/src/providers/menu_provider.dart';
import 'package:america_precolombina/src/utils/icons_string_utils.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProviderHome.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];
    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getSymbol(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      options..add(widgetTemp)..add(Divider());
    });
    return options;
  }
}
