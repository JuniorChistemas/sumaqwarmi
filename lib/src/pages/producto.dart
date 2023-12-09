import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/models/productoModel.dart';
import 'package:sumaqwarmi2/src/providers/productoProvider.dart';
import 'package:sumaqwarmi2/src/utils/validaciones.dart' as val;


class ProductoPage extends StatefulWidget {
  const ProductoPage({super.key});

  @override
  State<ProductoPage> createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {

  ProductoModel producto = new ProductoModel();

  final db = new ProductoProvider();

  //key para validar el formulario
  final llaveForm = GlobalKey<FormState>();
  //key para obtener una referencia snackbar
  final llaveScaffol = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    //tomamos el argumento
    final ProductoModel? productoUpdate = ModalRoute.of(context)!.settings.arguments as ProductoModel?;
    if (productoUpdate?.idu != null) {
      producto = productoUpdate!;
    }
    return Scaffold(
      key: llaveScaffol,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[100],
        title: Text('CRUD productos'),
        actions:<Widget> [
          IconButton(onPressed: (){}, icon: Icon(Icons.photo)),
          IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: llaveForm,
            child: Column(
              children:<Widget> [
                _Nombre(),
                _Precio(),
                _ingredientes(),
                _tratamiento(),
                _beneficios(),
                _populares(),
                _crearBotom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _Nombre(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      initialValue: producto.nombre,
      onSaved: (value) => producto.nombre = value,
      validator: (value){
        return (value!.length>=3)?null:'incorrecto';
      },
    );
  }
  Widget _Precio(){
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: 'Precio'
      ),
      initialValue: producto.precio.toString(),
        onSaved: (value) => producto.precio = double.parse(value.toString()),
      validator: (value){
        if(val.numero(value.toString())){
          return null;
        }else{
          return 'solo numeros';
        }
      },
    );
  }
  Widget _ingredientes(){
    return TextFormField(
      initialValue: producto.ingredientes,
      onSaved: (value) => producto.ingredientes = value,
      decoration: InputDecoration(
          labelText: 'Ingredientes'
      ),
    );
  }
  Widget _tratamiento(){
    return TextFormField(
      initialValue: producto.tratamiento,
      onSaved: (value) => producto.tratamiento = value,
      decoration: InputDecoration(
          labelText: 'Tratamiento'
      ),
    );
  }
  Widget _beneficios(){
    return TextFormField(
      initialValue: producto.beneficios,
      onSaved: (value) => producto.beneficios = value,
      decoration: InputDecoration(
          labelText: 'Beneficios'
      ),
    );
  }
  Widget _crearBotom(){
    return ElevatedButton(
        onPressed: (){
          enviarDatos();
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Guardar'),
              Text('     '),
              Icon(Icons.save),
            ],
          ),
        )
    );
  }
  void enviarDatos() async{
    if(!llaveForm.currentState!.validate()) return;
    print('Todos correcto');
    llaveForm.currentState?.save();
    print(producto.nombre.toString());
    print(producto.precio.toString());

    if(producto.idu==null){
      print("entre en el condicional para guardar");
      await db.CrearProducto(producto);
    }else{
      await db.ActualizarProducto(producto);
    }
    mostrarSnackbar('Informacion guardada');
  }
  void mostrarSnackbar(String mensaje){
    final snackBar = SnackBar(
        content: Text(mensaje),
        duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(llaveScaffol.currentContext!).showSnackBar(snackBar);
  }
  Widget _populares(){
    return SwitchListTile(
      value: producto.popular,
      title: Text('Popular'),
      onChanged: (value)=>setState(() {
        producto.popular = value;
      }),
      activeColor: Colors.pinkAccent,
    );
  }
}

