import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'folder_open': Icons.folder_open,
  'map': Icons.map,
  'mediation': Icons.mediation,
  'brightness_4_outlined': Icons.brightness_4_outlined,
  'sports_esports': Icons.sports_esports
};

final _symbols = <String, CircleAvatar>{
  'incas_symbol': CircleAvatar(
    backgroundImage: NetworkImage(
        'https://www.simboloteca.com/wp-content/uploads/2019/04/viracocha.jpg'),
  ),
  'mayas_symbol': CircleAvatar(
    backgroundImage: NetworkImage(
        'https://grandesmitos.com/wp-content/uploads/2020/03/simbolog%C3%ADa-maya1.jpg'),
  ),
  'aztecas_symbol': CircleAvatar(
    backgroundImage: NetworkImage(
        'https://diccionariodesimbolos.org/wp-content/uploads/2019/11/bf27726b6a5ad140664b6550ac3e04a7-300x264.jpg'),
  ),
};

Icon getIcon(String nameIcon) {
  return Icon(
    _icons[nameIcon],
    color: Colors.amber,
  );
}

CircleAvatar getSymbol(String nameSymbol) {
  return _symbols[nameSymbol];
}
