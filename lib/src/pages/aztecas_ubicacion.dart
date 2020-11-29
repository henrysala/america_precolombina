import 'package:flutter/material.dart';

class AztecasUbicacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ubicacion de los Aztecas')),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardText(),
        ],
      ),
    );
  }

  Widget _cardText() {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          FadeInImage(
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Aztec_Empire_-_es.svg/800px-Aztec_Empire_-_es.svg.png'),
              placeholder: AssetImage('assets/giphy.gif'),
              fadeInDuration: Duration(milliseconds: 100),
              height: 300.0,
              width: 360.0,
              fit: BoxFit.cover),
          ListTile(
            title: Text('Ubicación del Imperio azteca'),
            contentPadding: EdgeInsets.all(20.0),
            subtitle: Text(
                '\nLos aztecas se establecieron en México Tenochtitlan en el centro del Valle de México, expandiendo su control hacia ciudades-estado ubicadas en los actuales estados de México, Morelos, Veracruz, Guerrero, Puebla, Oaxaca; la costa de Chiapas, Hidalgo, y parte de Guatemala.'),
          )
        ],
      ),
    );
  }
}
