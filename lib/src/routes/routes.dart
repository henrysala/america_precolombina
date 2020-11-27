import 'package:flutter/material.dart';
//propios

Map<String, WidgetBuider> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
  };
}
