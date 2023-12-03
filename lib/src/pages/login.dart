import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Stack
      body: Stack(
        children:<Widget> [
          _fondo(context),
          _cuadroDatos(context),
        ],
      ),
    );
  }
  Widget _fondo(BuildContext context){
    //obtener el tamaño
    final size = MediaQuery.of(context).size;
    final fondo =  Container(
      height: size.height*0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors:<Color> [
                Color.fromRGBO(52, 54, 101, 1.0),
                Color.fromRGBO(35, 37, 57, 1.0),
              ]
          )
      ),
    );
    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
    final icono = Container(
      padding: EdgeInsets.only(top: 80.0),
      child: const Column(
        children:<Widget> [
          Icon(Icons.account_circle,color: Colors.white,size: 100.0,),
          SizedBox(height: 10.0,width: double.infinity,),
          Text('Inicia sesión',style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),)
        ],
      ) ,
    );
    return Stack(
      children:<Widget> [
        fondo,
        Positioned(child: circulo, top: 90.0, left: 30.0,),
        Positioned(child: circulo, top: -40.0, right: -30.0,),
        Positioned(child: circulo, bottom: -50.0, right: -10.0,),
        Positioned(child: circulo, bottom: 120.0, right: 20.0,),
        Positioned(child: circulo, bottom: -50.0, left: -20.0,),
        icono
      ],
    );
  }
  Widget _cuadroDatos(BuildContext context){
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children:<Widget> [
          SafeArea(child: Container(
            height: 180.0,
          )),
          Container(
            width: size.width*0.85,
            margin:  const EdgeInsets.symmetric(vertical: 30.0),
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow:<BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0,5.0),
                    spreadRadius: 3.0,
                  ),
                ]
            ),
            child: Column(
              children:<Widget> [
                const Text("INGRESO",style: TextStyle(fontSize: 20.0),),
                const SizedBox(height: 60.0),
                _crearCorreo(),
                const SizedBox(height: 30.0),
                _crearPassword(),
                const SizedBox(height: 30.0),
                _crearBoton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _crearCorreo(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(Icons.alternate_email),
            hintText: 'ejemplo.@gmailcom',
            labelText: 'correo electronico'
        ),
      ),
    );
  }
  Widget _crearPassword(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.lock),
            labelText: 'contraseña'
        ),
      ),
    );
  }
  Widget _crearBoton(){
    return ElevatedButton(
      onPressed: (){},
      child:Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 15.0),
        child:  Text('Ingresar'),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        primary: Colors.pinkAccent,
        onPrimary: Colors.white,
      ),
    );
  }
}
