import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/models/productoModel.dart';
import 'package:sumaqwarmi2/src/providers/productoProvider.dart';
import 'package:sumaqwarmi2/src/widgets/fondo.dart';
class MascarillaPage extends StatelessWidget {
  final provider = ProductoProvider();
  @override
  Widget build(BuildContext context) {
    String textoRecibido = ModalRoute.of(context)!.settings.arguments as String;
    if(textoRecibido.isEmpty){
      print('no recibi ningun texto');
    }
    Map<String, String> resultados = {
      "mascarilla"  : "Mascarillas",
      "jabon"       : "Jabones",
      "kit"         : "Kits",
      "crema"       : "Cremas",
      "facial"      : "Faciales",
      "exfoliante"  : "Exfoliantes",
      "tonico"      : "Tonicos faciales",
      "otros"       : "Otros",
    };

    String resultado = resultados.containsKey(textoRecibido)
        ? resultados[textoRecibido]!
        : "Otros";
    return Scaffold(
      body: Stack(
        children:<Widget> [
          const FondoApp(),
          SingleChildScrollView(
            child: Column(
              children:<Widget> [
                _titulos(),
                _crearCars(resultado),
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
              Text('Mi catalogo',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0,),
              Text('Productos de calidad y naturales para la piel',style: TextStyle(color: Colors.white,fontSize: 12.0))
            ],
          ),
        )
    );
  }
  Widget _crearCars(String categoria){
    return FutureBuilder(
      future: provider.cargarDatosMascarilla(categoria),
      builder: (BuildContext context,AsyncSnapshot sn){
        if(sn.hasData){
          return _crearTarjetasPageView(sn.data);
        }else{
          return Container(
              child: const Center(
                child: CircularProgressIndicator(),
              )
          );
        }
      },
    );
  }
  Widget _crearTarjetasPageView(List<ProductoModel> autores){
    return SizedBox(
            height: 580.0,
            child: ListView.builder(
            controller: PageController(
              viewportFraction: 0.3,
              initialPage: 1,
            ),
            itemCount: autores.length,
            itemBuilder: (context,i){
              return tarjeta(autores[i]);
            }
          ),
    );
  }
  Widget tarjeta(ProductoModel actor){
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage("assets/placeholder.gif"),
              fit: BoxFit.cover,
              fadeInDuration: Duration(seconds: 1),
              image: NetworkImage(actor.foto.toString()),
              height: 160.0,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
              child: Text(
                "${actor.ingredientes}\n\n${actor.beneficios}\n\n${actor.nombre}\n\n${actor.precio}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
