import 'package:america_precolombina/src/pages/aztecas/aztecas_vestimenta.dart';
import 'package:flutter/material.dart';

//Propias
import 'package:america_precolombina/src/pages/home_page.dart';
import 'package:america_precolombina/src/pages/incas_page.dart';
import 'package:america_precolombina/src/pages/mayas_page.dart';
import 'package:america_precolombina/src/pages/aztecas/aztecas_page.dart';
import 'package:america_precolombina/src/pages/incas/ubicacion.dart';
import 'package:america_precolombina/src/pages/aztecas/aztecas_estructura.dart';
import 'package:america_precolombina/src/pages/aztecas/aztecas_ubicacion.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'incas': (BuildContext context) => IncasPage(),
    'mayas': (BuildContext context) => MayasPage(),
    'aztecas': (BuildContext context) => AztecasPage(),

    'incas/ubicacion': (BuildContext context) => IncasUbicacionPage(),

    'aztecasUbicacion': (BuildContext context) => AztecasUbicacionPage(),
    'aztecasEstructura': (BuildContext context) => AztecasEstructuraPage(),
    'aztecasVestimenta': (BuildContext context) => AztecasVestimentaPage(),
    //'aztecasMitologia': (BuildContext context) => AztecasMitologiaPage(),
    //'aztecasReto': (BuildContext context) => AztecasRetoPage(),
  };
}
