import 'dart:io';

import 'package:rxdart/rxdart.dart';
import 'package:sumaqwarmi2/src/models/productoModel.dart';
import 'package:sumaqwarmi2/src/providers/productoProvider.dart';

class ProductoBloc{
  final _productosController = new BehaviorSubject<List<ProductoModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _productosProvider = new ProductoProvider();

  Stream<List<ProductoModel>> get productosStream => _productosController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void cargarProductos()async{
    final productos = await _productosProvider.cargarDatos();
    _productosController.sink.add(productos);
  }

  void cargarProductosPopulares()async{
    final productos = await _productosProvider.cargarDatosPopulares();
    _productosController.sink.add(productos);
  }
  void AgregarProductos(ProductoModel producto)async{
     _cargandoController.sink.add(true);
     await _productosProvider.CrearProducto(producto);
    _cargandoController.sink.add(false);
  }
  Future<String> SubirFotos(File foto) async{
    _cargandoController.sink.add(true);
    final fotoUrl = await _productosProvider.subirImagen(foto);
    _cargandoController.sink.add(false);
    return fotoUrl;
  }
  void EditarProductos(ProductoModel producto)async{
    _cargandoController.sink.add(true);
    await _productosProvider.ActualizarProducto(producto);
    _cargandoController.sink.add(false);
  }
  void BorrarProductos(String idProducto)async{
    await _productosProvider.borrarProducto(idProducto);
  }
  dispose(){
    _productosController.close();
    _cargandoController.close();
  }
}