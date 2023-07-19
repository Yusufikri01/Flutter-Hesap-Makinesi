import 'package:calculator/ui/Extension.dart';
import 'package:flutter/material.dart';

class ColorSchemes {
  static ColorSchemes? _instance;

  static ColorSchemes get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = ColorSchemes.init();
      return _instance!;
    }
  }

  ColorSchemes.init();

  static final Map<String, String> _colors = {
    'black': '111115',
    'grey': '808080',
    'orange': 'FFA500',
    'white': 'FFFFFF',
    'black45': '2D2D39',
    'new1': '343434',
  };

  Color get black => HexColor.fromHex(_colors['black']!);
  Color get grey => HexColor.fromHex(_colors['grey']!);
  Color get orange => HexColor.fromHex(_colors['orange']!);
  Color get white => HexColor.fromHex(_colors['white']!);
  Color get black45 => HexColor.fromHex(_colors['black45']!);
  Color get new1 => HexColor.fromHex(_colors['new1']!);
}
