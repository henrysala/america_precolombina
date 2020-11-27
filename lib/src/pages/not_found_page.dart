import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina no encontrada'),
      ),
      body: Center(
        child: Text('error 404: not found'),
      ),
    );
  }
}
