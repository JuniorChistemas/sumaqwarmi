import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/providers/categoria_provider.dart';
import 'package:sumaqwarmi2/src/providers/inicio_provider.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:sumaqwarmi2/src/utils/icono_string.dart';
class home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _categoria(),
      appBar: AppBar(
        title: Text("PRINCIPAL"),
        backgroundColor: Color.fromRGBO(250,165,185,1),
        centerTitle: true,
      ),
      body: ListView(
        children:<Widget> [
          cuerpo(),
          Divider(height: 30.0,color: Color.fromRGBO(2352, 212, 222, 0.6)),
          Text("PRODUCTOS POPULARES",textAlign: TextAlign.center),
          Divider(height: 30.0,color: Color.fromRGBO(252, 212, 222, 0.6)),
          botom(),
        ],
      ),
      bottomNavigationBar: _menuInferior()
    );
  }
  Widget botom(){
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Center(
          child: ElevatedButton(
            child: Text('AGREGAR'),
            style: ElevatedButton.styleFrom(
              primary: Colors.pinkAccent, // background
              onPrimary: Colors.white, // foreground
              //estilo del boton en esquinas redondeadas
              shape: StadiumBorder(),
            ),
            onPressed: () {
            },
          )
      ),
    );
  }
  BottomNavigationBar _menuInferior(){
    return BottomNavigationBar(
      mouseCursor: MaterialStateMouseCursor.clickable,
      fixedColor: Colors.pinkAccent,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Categoria',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        )
      ],
      onTap: (int index){
        if(index==0){
          print("house");
        }else if(index==1){
          print("categoria");
          //aqui iniciamos el menu lateral para que se reconozca
          _scaffoldKey.currentState?.openDrawer();
        }else if(index==2){
          //menu del perfil de usuaurio
          print("perfil");
        }else{
          print("house 0");
        }
      },
    );
  }
  Drawer _categoria(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:<Widget> [
          DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/fondoR.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.all(20.0),
          ),
          //_lista(),
          //aqui voy a agregar la lista de items

        ],
      ),
    );
  }
  Widget cuerpo() {
    return FutureBuilder(
      future: informacion.cargarLinks(),
      initialData: [],
      builder: (context, AsyncSnapshot sna) {
        return _swiper(sna.data, context);
      },
    );
  }

  Widget _swiper(List<dynamic> data, BuildContext context) {
    final _screnSize = MediaQuery.of(context).size;
    return Container(
      width: _screnSize.width*1,
      height: _screnSize.height*0.4,
      margin: EdgeInsets.only(top: 20.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          if (index < data.length) {
            return FadeInImage(
              placeholder: AssetImage('assets/placeholder.gif'),
              //imagen de internet
              image: NetworkImage(data[index]['link']),
              //duracion
              fadeInDuration: Duration(milliseconds: 200),
              //para que se adapte a todo lo ancho posible
              fit: BoxFit.fitWidth,
              imageSemanticLabel: "hola",
              //altura
            );
          } else {
            return Column();
          }
        },
        itemCount: 10,
        viewportFraction: 0.8,
        scale: 0.1,
      ),
    );
  }

  Widget _lista(){
    return FutureBuilder(future: menu.cargarRutas(),
      initialData: [],
      builder: (context,AsyncSnapshot sna){
        return ListView(
          // imprimir por consola el sna.data para verificar algo
          children: _listaItems(sna.data,context),
        );
      },
    );
  }
  List<Widget> _listaItems(List<dynamic> data,BuildContext context){
    final List<Widget> opciones =[];
    //el error salia por que cuando el forEach itera inicialmente es una lista vacia
    data.forEach((opt) {
      final WidgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        //trailing: Icon(Icons.arrow_right),
        onTap: (){
          //final route = MaterialPageRoute(builder: (context){
          //return AlertPage();
          //}
          //);
          //Navigator.push(context, route);
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(WidgetTemp)..add(Divider());
    });
    return opciones;
  }
}
