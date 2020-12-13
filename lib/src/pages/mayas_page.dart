import 'package:flutter/material.dart';

//Propias
import 'package:america_precolombina/src/providers/menu_provider.dart';
import 'package:america_precolombina/src/utils/icons_string_utils.dart';

class MayasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Civilización Maya'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: provider.loadData('data/mayas_info.json', 'rutasMayas'),
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
        leading: getIconMayas(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      options..add(widgetTemp)..add(Divider());
    });
    return options;
  }
}
