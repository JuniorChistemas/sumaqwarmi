import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/widgets/fondo.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
      children:<Widget> [
        const FondoApp(),
        SingleChildScrollView(
          child: Column(
            children:<Widget> [
              _titulos(),
              SizedBox(height: 80.0,),
              Center(
                child: Image.asset('assets/logo.png'),
              ),
              Placeholder(
                color: Colors.cyan,
                fallbackWidth: 4.0,
                fallbackHeight: 50.0,
              ),
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
              Text('Populares',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0,),
              Text('Productos mas vendidos y reconocidos',style: TextStyle(color: Colors.white,fontSize: 12.0))
            ],
          ),
        )
    );
  }
  
}
