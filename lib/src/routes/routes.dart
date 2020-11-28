import 'package:america_precolombina/src/pages/aztecas_ubicacion.dart';
import 'package:flutter/material.dart';

//Propias
import 'package:america_precolombina/src/pages/home_page.dart';
import 'package:america_precolombina/src/pages/incas_page.dart';
import 'package:america_precolombina/src/pages/mayas_page.dart';
import 'package:america_precolombina/src/pages/aztecas_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'incas': (BuildContext context) => IncasPage(),
    'mayas': (BuildContext context) => MayasPage(),
    'aztecas': (BuildContext context) => AztecasPage(),
    'aztecasUbicacion': (BuildContext context) => AztecasUbicacionPage()
  };
}
