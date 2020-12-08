import 'package:flutter/material.dart';

//Propias
import 'package:america_precolombina/src/providers/menu_provider.dart';

class MayasEstructuraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Estructura de los Mayas')),
        body: _cardList());
  }

  Widget _cardList() {
    return FutureBuilder(
      future: cardProviderEstructuraMayas.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _cardItem(snapshot.data),
        );
      },
    );
  }

  List<Widget> _cardItem(List<dynamic> data) {
    final List<Widget> info = [];
    data.forEach((element) {
      final widgetTemp = Card(
        elevation: 20.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: [
            ListTile(
              title: Text(element['titulo']),
              contentPadding: EdgeInsets.all(20.0),
              subtitle: Text(element['texto']),
            ),
            FadeInImage(
                image: NetworkImage(element['imagen']),
                placeholder: AssetImage('assets/giphy.gif'),
                fadeInDuration: Duration(milliseconds: 100),
                height: 250.0,
                width: 350.0,
                fit: BoxFit.cover),
            Container(
                padding: EdgeInsets.all(5.0), child: Text(element['titulo']))
          ],
        ),
      );
      info
        ..add(widgetTemp)
        ..add(SizedBox(
          height: 40.0,
        ));
    });
    return info;
  }
}
