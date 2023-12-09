import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  String? idu;
  String? nombre;
  double? precio;
  String? ingredientes;
  String? tratamiento;
  String? beneficios;
  String? foto;
  bool popular;

  ProductoModel({
     this.idu,
     this.nombre = '',
     this.precio = 0.00,
     this.ingredientes,
     this.tratamiento,
     this.beneficios,
     this.foto,
     this.popular = true,
  });

  setId(String id){
    return this.idu = id;
  }
  factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
    idu: json["id"],
    nombre: json["nombre"],
    precio: json["precio"]?.toDouble(),
    ingredientes: json["ingredientes"],
    tratamiento: json["tratamiento"],
    beneficios: json["beneficios"],
    foto: json["foto"],
    popular: json["popular"],
  );

  Map<String, dynamic> toJson() => {
    "id"            : idu,
    "nombre"        : nombre,
    "precio"        : precio,
    "ingredientes"  : ingredientes,
    "tratamiento"   : tratamiento,
    "beneficios"    : beneficios,
    "foto"          : foto,
    "popular"       : popular,
  };
}
