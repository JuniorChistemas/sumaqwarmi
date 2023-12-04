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
                _botonesRedondeados(),
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
  Widget _crearBoton(Color color,IconData icono,String texto){
    return Container(
      height: 180.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:<Widget> [
          SizedBox(height: 5.0,),
          CircleAvatar(
            backgroundColor: color,
            radius: 35.0,
            child: Icon(icono,color: Colors.white,size: 20,),
          ),
          Text(texto,style: TextStyle(color: Colors.pinkAccent),),
          SizedBox(height: 5.0,),
        ],
      ),
    );
  }
  Widget _botonesRedondeados(){
    return Table(
      children:<TableRow> [
        TableRow(
            children:<Widget> [
              _crearBoton(Colors.blue,Icons.cable,'CABELLO'),
              _crearBoton(Colors.purple,Icons.ac_unit_sharp,'EXFOLIANTES'),
            ]
        ),
        TableRow(
            children:<Widget> [
              _crearBoton(Colors.pinkAccent,Icons.account_circle_outlined,'FACIALES'),
              _crearBoton(Colors.orange,Icons.account_balance_wallet_rounded,'JABONES ORGANICOS'),
            ]
        ),
        TableRow(
            children:<Widget> [
              _crearBoton(Colors.lightGreen,Icons.add_moderator,'MASCARIILAS'),
              _crearBoton(Colors.grey,Icons.padding_rounded,'KIST'),
            ]
        ),
        TableRow(
            children:<Widget> [
              _crearBoton(Colors.cyan,Icons.add_circle,'TONICO FACIAL'),
              _crearBoton(Colors.teal,Icons.production_quantity_limits_outlined,'OTROS PRODUCTOS'),
            ]
        ),
      ],
    );
  }
}

