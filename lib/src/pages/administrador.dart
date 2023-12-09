import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/models/productoModel.dart';
import 'package:sumaqwarmi2/src/providers/productoProvider.dart';
class AdministradorPage extends StatelessWidget {

  final productosProvider = new ProductoProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //aqui le podemos agregar el nombre del usuario y luego decir bienvenido
        title: Text('Administrador'),
      ),
      body: _listProductos(),
      floatingActionButton: _crearBotom(context),
    );
  }
  Widget _listProductos(){
    return FutureBuilder(
        future: productosProvider.cargarDatos(),
        initialData: [],
        builder: (context,AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mientras espera que la operación asíncrona termine
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Si hay un error
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Si no hay datos
            return Center(
              child: Text('No hay productos disponibles'),
            );
          } else {
            // Si hay datos, muestra la lista de productos
            List<ProductoModel> productos = snapshot.data;
            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                ProductoModel producto = productos[index];
                return Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      child: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                    confirmDismiss: (direccion) async{
                      bool resultado = false;
                      resultado = await showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text('¿Eliminar?'),
                              actions:<Widget> [
                                TextButton(
                                onPressed: (){
                                  return Navigator.pop(context,false,);
                                },
                                child: Text('cancelar')
                                ),
                                TextButton(
                                    onPressed: (){
                                      return Navigator.pop(context,true,);
                                    },
                                    child: Text('SI, deacuerdo')
                                ),
                              ],
                            );
                          }
                      );
                      return resultado;
                    },
                    onDismissed: (direccion){
                      //funcion para borrar un producto
                      productosProvider.borrarProducto(producto.idu!);
                    },
                    child: ListTile(
                      title: Text(producto.nombre!),
                      subtitle: Text('Id: ${producto.idu}'),
                      onTap: (){
                        Navigator.pushNamed(context, 'producto',arguments: producto);
                      },
                    ));
              },
            );
          }
        },
    );
  }
  Widget _crearBotom(BuildContext context){
    return FloatingActionButton(
        onPressed: () =>Navigator.pushNamed(context, 'producto'),
        child: Icon(Icons.add),
    );
  }
}
