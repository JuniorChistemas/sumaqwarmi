import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/bloc/provider.dart';
import 'package:sumaqwarmi2/src/widgets/fondo.dart';
import 'package:sumaqwarmi2/src/widgets/popular.dart';

class Popular extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productoBloc = Provider.productosBloc(context);
    productoBloc.cargarProductosPopulares();
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
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(height: 10.0,),
                    _targetas(productoBloc),
                  ],
                ),
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
              Text('SUMAQWARMI te presenta los TOP 10 productos mas vendidos y recomendados para tu cuidado de la piel.',style: TextStyle(color: Colors.white,fontSize: 14.0)),
            ],
          ),
        )
    );
  }
  Widget _targetas(ProductoBloc productoBloc){
    return StreamBuilder(
        stream: productoBloc.productosStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return CardPopular(productos: snapshot.data!);
          }else{
            return Container(
                height: 400.0,
                child: Center(
                  child: CircularProgressIndicator(),
                )
            );
          }
        }
    );
  }
  
}
