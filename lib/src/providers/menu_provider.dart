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

class _MenuProviderMayas {
  List<dynamic> options = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/mayas_info.json');

    Map dataJson = json.decode(resp);
    options = dataJson['rutasMayas'];

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

class _CardProviderUbicacionMayas {
  List<dynamic> info = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/mayas_info.json');

    Map dataJson = json.decode(resp);
    info = dataJson['ubicacion'];

    return info;
  }
}

class _CardProviderEstructuraMayas {
  List<dynamic> info = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/mayas_info.json');

    Map dataJson = json.decode(resp);
    info = dataJson['estructura'];

    return info;
  }
}

class _CardProviderMitologiaMayas {
  List<dynamic> info = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/mayas_info.json');

    Map dataJson = json.decode(resp);
    info = dataJson['mitologia'];

    return info;
  }
}

final menuProviderHome = new _MenuProviderHome();
final menuProviderAztecas = new _MenuProviderAztecas();
final cardProviderUbicacionAztecas = new _CardProviderUbicacionAztecas();
final menuProviderMayas = new _MenuProviderMayas();
final cardProviderUbicacionMayas = new _CardProviderUbicacionMayas();
final cardProviderEstructuraMayas = new _CardProviderEstructuraMayas();
final cardProviderMitologiaMayas = new _CardProviderMitologiaMayas();
