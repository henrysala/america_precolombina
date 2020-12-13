import 'dart:convert';

import 'package:flutter/services.dart';

class _Provider {
  List<dynamic> info = [];

  Future<List<dynamic>> loadData(String file, String data) async {
    final resp = await rootBundle.loadString(file);

    Map dataJson = json.decode(resp);
    info = dataJson[data];

    return info;
  }
}

final provider = new _Provider();
