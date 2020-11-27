import 'dart:convert';

import 'package:flutter/services.dart';

class _MenuProvider {
  List<dynamic> options = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/menu_options.json');

    Map dataJson = json.decode(resp);
    options = dataJson['rutas'];

    return options;
  }
}

final menuProvider = new _MenuProvider();
