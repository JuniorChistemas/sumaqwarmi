import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _categoria{
  List<dynamic> optiones = [];
  _categoria(){
  }
  Future<List<dynamic>> cargarRutas()async{
    final resp = await rootBundle.loadString('data/menu.json');
    Map dataMap = json.decode(resp);
    optiones = dataMap['rutas'];
    return optiones;
  }
}
final menu = new _categoria();