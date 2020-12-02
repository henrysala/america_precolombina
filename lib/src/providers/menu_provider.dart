import 'dart:convert';

import 'package:flutter/services.dart';

class _MenuProviderHome {
  List<dynamic> options = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/menu_options.json');

    Map dataJson = json.decode(resp);
    options = dataJson['rutas'];

    return options;
  }
}

class _MenuProviderAztecas {
  List<dynamic> options = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/aztecas_info.json');

    Map dataJson = json.decode(resp);
    options = dataJson['rutasAztecas'];

    return options;
  }
}

class _CardProviderUbicacionAztecas {
  List<dynamic> info = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/aztecas_info.json');

    Map dataJson = json.decode(resp);
    info = dataJson['ubicacion'];

    return info;
  }
}

final menuProviderHome = new _MenuProviderHome();
final menuProviderAztecas = new _MenuProviderAztecas();
final cardProviderUbicacionAztecas = new _CardProviderUbicacionAztecas();
