import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mime_type/mime_type.dart';
import 'package:sumaqwarmi2/src/models/productoModel.dart';


import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
class ProductoProvider{
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> CrearProducto(ProductoModel producto) async {
    try {
      Map<String, dynamic> productoData = producto.toJson();
      // Si no tiene un ID, utiliza 'add' para generar uno automáticamente
      DocumentReference reference = await db.collection('productos').add(productoData);
      // Obtén el ID único asignado por Firestore
      String idDocumento = reference.id;
      // Actualiza el campo 'id' en el documento recién creado con el ID único
      await db.collection('productos').doc(idDocumento).update({'id': idDocumento});
      // Actualiza el ID en tu objeto ProductoModel
      producto.setId(idDocumento);
      print('Producto guardado exitosamente en Firestore con ID: ${producto.idu}');
    } catch (error) {
      print('Error al guardar el producto en Firestore: $error');
    }
  }
  Future<List<ProductoModel>> cargarDatos() async{
    try {
    List<ProductoModel> items = [];
    CollectionReference reference = db.collection('productos');
    QuerySnapshot datos = await reference.get();
    items = datos.docs.map((doc) {
      String id = doc.id; // Obtener el ID único del documento
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      // Añadir el ID al campo 'id' en los datos
      data['id'] = id;
      // Crear un ProductoModel con el ID y el resto de los datos
      ProductoModel producto = ProductoModel.fromJson(data);

      // Imprimir el ID del producto en la consola
      print('ID del producto: ${producto.idu}');

      return producto;
    }).toList();
    print(items.toString());
    return items;
    } catch (error) {
      print('Error al obtener productos desde Firestore: $error');
      return [];
    }
  }
  Future<List<ProductoModel>> cargarDatosPopulares() async{
    try {
      List<ProductoModel> items = [];
      CollectionReference reference = db.collection('productos');
      QuerySnapshot datos = await reference.where('popular', isEqualTo: true).get();
      items = datos.docs.map((doc) {
        String id = doc.id; // Obtener el ID único del documento
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        // Añadir el ID al campo 'id' en los datos
        data['id'] = id;
        // Crear un ProductoModel con el ID y el resto de los datos
        ProductoModel producto = ProductoModel.fromJson(data);
        return producto;
      }).toList();
      print(items.toString());
      return items;
    } catch (error) {
      print('Error al obtener productos desde Firestore: $error');
      return [];
    }
  }
  Future<void> borrarProducto(String id)async{
    await db.collection('productos').doc(id).delete();
    print('producto borrado');
  }
  Future<void> ActualizarProducto(ProductoModel producto) async {
    try {
      // Convierte el objeto a un mapa (serialización)
      Map<String, dynamic> productoData = producto.toJson();

      // Actualiza el documento en Firestore con los nuevos datos
      await db.collection('productos').doc(producto.idu!).update(productoData);

      print('Producto actualizado exitosamente en Firestore con ID: ${producto.idu}');
    } catch (error) {
      print('Error al actualizar el producto en Firestore: $error');
    }
  }



  //subir imagene

  Future<String> subirImagen(File imagen)async{
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dfrvzj716/upload?upload_preset=jo1xefav');
    final tipo = mime(imagen.path)?.split('/');

    final imageUpload = http.MultipartRequest(
      'POST',
      url
    );
    final file = await http.MultipartFile.fromPath(
        'file',
        imagen.path,
        contentType: MediaType(tipo![0],tipo[1])
    );
    imageUpload.files.add(file);
    final respuesta = await imageUpload.send();
    final resp = await http.Response.fromStream(respuesta);
    if(resp.statusCode !=200 && resp.statusCode!=201){
      print("algo salio mal");
      return "";
    }
    final respData = json.decode(resp.body);
    print(respData);
    return respData['secure_url'];
  }






}