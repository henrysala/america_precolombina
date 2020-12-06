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

class _CardProviderEstructuraAztecas {
  List<dynamic> info = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/aztecas_info.json');

    Map dataJson = json.decode(resp);
    info = dataJson['estructura'];

    return info;
  }
}

class _CardProviderVestimentaAztecas {
  List<dynamic> info = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/aztecas_info.json');

    Map dataJson = json.decode(resp);
    info = dataJson['vestimenta'];

    return info;
  }
}

class _CardProviderMitologiaAztecas {
  List<dynamic> info = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/aztecas_info.json');

    Map dataJson = json.decode(resp);
    info = dataJson['mitologia'];

    return info;
  }
}

final menuProviderHome = new _MenuProviderHome();
final menuProviderAztecas = new _MenuProviderAztecas();
final cardProviderUbicacionAztecas = new _CardProviderUbicacionAztecas();
final cardProviderEstructuraAztecas = new _CardProviderEstructuraAztecas();
final cardProviderVestimentaAztecas = new _CardProviderVestimentaAztecas();
final cardProviderMitologiaAztecas = new _CardProviderMitologiaAztecas();
