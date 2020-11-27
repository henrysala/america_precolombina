import 'package:america_precolombina/src/pages/hom_page.dart';
import 'package:flutter/material.dart';
//propios

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
  };
}
