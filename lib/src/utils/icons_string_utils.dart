import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'incas': Icons.folder_open,
  'mayas': Icons.folder_open,
  'aztecas': Icons.folder_open
};

Icon getIcon(String nameIcon) {
  return Icon(
    _icons[nameIcon],
    color: Colors.amber,
  );
}
