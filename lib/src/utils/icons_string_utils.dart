import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'folder_open': Icons.folder_open,
  'map': Icons.map,
  'mediation': Icons.mediation,
  'reduce_capacity': Icons.reduce_capacity,
  'local_laundry_service': Icons.local_laundry_service,
  'local_offer': Icons.local_offer,
  'brightness_4_outlined': Icons.brightness_4_outlined,
  'sports_esports': Icons.sports_esports,

  //Mayas
  'gps_fixed': Icons.gps_fixed,
  'account_tree': Icons.account_tree,
  'videogame_asset': Icons.videogame_asset
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
    backgroundImage: AssetImage('assets/aztecas_icon.jpg'),
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

Icon getIconMayas(String nameIcon) {
  return Icon(
    _icons[nameIcon],
    color: Colors.redAccent,
  );
}
