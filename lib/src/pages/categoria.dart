import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/widgets/fondo.dart';

class Categoria extends StatefulWidget {
  const Categoria({super.key});

  @override
  State<Categoria> createState() => _CategoriaState();
}

class _CategoriaState extends State<Categoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget> [
          const FondoApp(),
          SingleChildScrollView(
            child: Column(
              children:<Widget> [
                _titulos(),
                _botonesRedondeados(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _titulos(){
    return SafeArea(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Text('Categorias',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0,),
              Text('Productos de calidad y naturales para la piel',style: TextStyle(color: Colors.white,fontSize: 12.0))
            ],
          ),
        )
    );
  }
  Widget _crearBoton(BuildContext context, Color color, IconData icono, String texto, String ruta) {
    return GestureDetector(
      child: Container(
        height: 180.0,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height: 5.0,),
            CircleAvatar(
              backgroundColor: color,
              radius: 35.0,
              child: Icon(icono, color: Colors.white, size: 20,),
            ),
            Text(texto, style: TextStyle(color: Colors.pinkAccent),),
            SizedBox(height: 5.0,),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'mascarilla',arguments: ruta );
      },
    );
  }

  Widget _botonesRedondeados(BuildContext context) {
    return Table(
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            _crearBoton(context, Colors.blue, Icons.cable, 'Mascarillas', 'mascarilla'),
            _crearBoton(context, Colors.purple, Icons.ac_unit_sharp, 'Exfoliantes', 'exfoliante'),
          ],
        ),
        TableRow(
          children: <Widget>[
            _crearBoton(context, Colors.pinkAccent, Icons.account_circle_outlined, 'Faciales', 'facial'),
            _crearBoton(context, Colors.orange, Icons.account_balance_wallet_rounded, 'Jabones organicos', 'jabon'),
          ],
        ),
        TableRow(
          children: <Widget>[
            _crearBoton(context, Colors.lightGreen, Icons.add_moderator, 'Cremas', 'crema'),
            _crearBoton(context, Colors.grey, Icons.padding_rounded, 'KIST', 'kit'),
          ],
        ),
        TableRow(
          children: <Widget>[
            _crearBoton(context, Colors.cyan, Icons.add_circle, 'Tonicos', 'tonico'),
            _crearBoton(context, Colors.teal, Icons.production_quantity_limits_outlined, 'OTROS PRODUCTOS', 'otros'),
          ],
        ),
      ],
    );
  }

}

