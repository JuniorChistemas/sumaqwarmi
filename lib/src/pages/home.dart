import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/providers/inicio_provider.dart';
import 'package:card_swiper/card_swiper.dart';
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
          //rgb(252,212,222)
          Divider(height: 30.0,color: Color.fromRGBO(252, 212, 222, 0.6)),
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
          _scaffoldKey.currentState?.openDrawer();
        }else if(index==2){
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
              child: Text("Categorias"),
              decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/fondoR.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.all(20.0),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("INICIO"),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Cabello"),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.adb_sharp),
            title: Text("Exfoliantes"),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text("Faciales"),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet_sharp),
            title: Text("Jabones organicos"),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.add_card_rounded),
            onTap: (){

            },
            title: Text("kits"),
          ),
          ListTile(
            leading: Icon(Icons.add_card_rounded),
            onTap: (){

            },
            title: Text("kits"),
          ),
          ListTile(
            leading: Icon(Icons.add_card_rounded),
            onTap: (){

            },
            title: Text("kits"),
          ),
          ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text("Mas Productos"),
            onTap: (){

            },
          ),

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
}
