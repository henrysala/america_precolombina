import 'package:flutter/material.dart';

class IncasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Cultura Inca'),
    ),
    body: Center(
      child: Column(
        children: [
          const SizedBox(height: 15),
          _createButton('Ubicación', () {Navigator.pushNamed(context, 'incas/ubicacion');}),
          const SizedBox(height: 15),
          _createButton('Estructura social', () {}),
          const SizedBox(height: 15),
          _createButton('Mitología', () {}),
          const SizedBox(height: 15),
          _createButton('Reto', () {}),
        ],)
      ),
    );
  }

  Widget _createButton(String name, dynamic function){
    return MaterialButton(
      minWidth: 175.0,
      height: 30.0,
      onPressed: function,
      textColor: Colors.white,
      child: Text(name),
      color: Colors.blue,
      
      padding: const EdgeInsets.all(10.0),);
  }
}
