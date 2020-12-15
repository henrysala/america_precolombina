import 'package:america_precolombina/src/pages/aztecas/aztecas_game.dart';
import 'package:flutter/material.dart';

//Propias
import 'package:america_precolombina/src/pages/home_page.dart';
import 'package:america_precolombina/src/pages/incas_page.dart';
import 'package:america_precolombina/src/pages/incas/incas_ubicacion.dart';
import 'package:america_precolombina/src/pages/incas/incas_estructura.dart';
import 'package:america_precolombina/src/pages/incas/incas_mitologia.dart';
import 'package:america_precolombina/src/pages/incas/incas_game.dart';
import 'package:america_precolombina/src/pages/mayas_page.dart';
import 'package:america_precolombina/src/pages/mayas/mayas_ubicacion.dart';
import 'package:america_precolombina/src/pages/mayas/mayas_mitologia.dart';
import 'package:america_precolombina/src/pages/mayas/mayas_estructura.dart';
import 'package:america_precolombina/src/pages/mayas/mayas_game.dart';
import 'package:america_precolombina/src/pages/aztecas/aztecas_page.dart';
import 'package:america_precolombina/src/pages/aztecas/aztecas_ubicacion.dart';
import 'package:america_precolombina/src/pages/aztecas/aztecas_estructura.dart';
import 'package:america_precolombina/src/pages/aztecas/aztecas_mitologia.dart';
import 'package:america_precolombina/src/pages/aztecas/aztecas_vestimenta.dart';


Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'incas': (BuildContext context) => IncasPage(),
    'mayas': (BuildContext context) => MayasPage(),
    'aztecas': (BuildContext context) => AztecasPage(),
    'incas/ubicacion': (BuildContext context) => IncasUbicacionPage(),
    'incas/estructura': (BuildContext context) => IncasEstructuraPage(),
    'incas/mitologia': (BuildContext context) => IncasMitologiaPage(),
    'incas/reto': (BuildContext context) => IncasGame(),
    'mayasUbicacion': (BuildContext context) => MayasUbicacionPage(),
    'mayasEstructura': (BuildContext context) => MayasEstructuraPage(),
    'mayasMitologia': (BuildContext context) => MayasMitologiaPage(),
    'mayasReto': (BuildContext context) => MayasGamePage(),
    'aztecasUbicacion': (BuildContext context) => AztecasUbicacionPage(),
    'aztecasEstructura': (BuildContext context) => AztecasEstructuraPage(),
    'aztecasVestimenta': (BuildContext context) => AztecasVestimentaPage(),
    'aztecasMitologia': (BuildContext context) => AztecasMitologiaPage(),
    'aztecasReto': (BuildContext context) => AztecasJuegoPage(),
  };
}
