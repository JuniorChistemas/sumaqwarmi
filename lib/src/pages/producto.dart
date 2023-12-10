import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  //bool
  bool _guardando = false;

  final db = new ProductoProvider();

  //key para validar el formulario
  final llaveForm = GlobalKey<FormState>();
  //key para obtener una referencia snackbar
  final llaveScaffol = GlobalKey<ScaffoldState>();
  //instancia para foto
  File? foto;

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
          IconButton(
              onPressed: (){
                _seleccionarFoto();
              },
              icon: Icon(Icons.photo)
          ),
          IconButton(onPressed:(){
            _tomarFoto();
          },
              icon: Icon(Icons.camera_alt)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: llaveForm,
            child: Column(
              children:<Widget> [
                _mostrarFoto(),
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
          (_guardando)?null:enviarDatos();
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
    setState(() {
      _guardando = true;
    });
    if(foto!=null){
      producto.foto = await db.subirImagen(foto!);
    }
    if(producto.idu==null){
      print("entre en el condicional para guardar");
      await db.CrearProducto(producto);
    }else{
      await db.ActualizarProducto(producto);
    }
    setState(() {
      _guardando = false;
    });
    mostrarSnackbar('Informacion guardada');
    Navigator.pushReplacementNamed(context, 'administrador');
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

  _seleccionarFoto()async{
    try {
       final fotoTemp = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (fotoTemp != null) {
        setState(() {
          foto = File(fotoTemp.path);
        });
      }
    } catch (e) {
      print('Error al seleccionar la foto: $e');
    }
  }
  Widget _mostrarFoto() {
    if (producto.foto != null) {
      return FadeInImage(
          placeholder: AssetImage('assets/placeholder.gif'),
          image: NetworkImage(producto.foto!),
          height: 300.0,
          fit: BoxFit.cover,
      ); // Puedes personalizar esto según tus necesidades
    } else if (foto != null) {
      return Image(
        image: FileImage(foto!),
        height: 300.0,
        fit: BoxFit.cover,
      );
    } else {
      // Si no hay foto, puedes mostrar una imagen predeterminada o algún indicador
      return Image.asset('assets/no-image.png', height: 300.0, fit: BoxFit.cover);
    }
  }

  _tomarFoto() async{
    try {
      final fotoTemp = await ImagePicker().pickImage(source: ImageSource.camera);
      if (fotoTemp != null) {
        setState(() {
          foto = File(fotoTemp.path);
        });
      }
    } catch (e) {
      print('Error al seleccionar la foto: $e');
    }
  }
}

