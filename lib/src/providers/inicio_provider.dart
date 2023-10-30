import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
class _InicioProvider{
  List<dynamic> links = [];

  _InicioProvider(){
    //cargarLinks();
  }

  Future<List<dynamic>>cargarLinks() async{
    final resp = await rootBundle.loadString('data/inicio.json');
    Map data = json.decode(resp);
    links = data['rutas'];
    return links;
  }
}
final informacion = new _InicioProvider();