import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/pages/categoria.dart';
import 'package:sumaqwarmi2/src/pages/login.dart';
import 'package:sumaqwarmi2/src/pages/popular.dart';


class Menu extends StatefulWidget {
  const Menu({super.key});
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int pagina = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(pagina),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }
  // funcion para indicar el index de la pagina segun corresponda
  Widget _callPage(int n){
    switch(n){
      case 0: return const Popular();
      case 1: return const Categoria();
      case 2: return const Login();
      default: return const Popular();
    }
  }
  //creamos la barra de navegacion en la parte inferior del aplicativo
  Widget _bottomNavigationBar(BuildContext context){
    return Theme(data: Theme.of(context).copyWith(
      //canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
       //textTheme: Theme.of(context).textTheme.copyWith(caption: const TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))
    ),
      child: BottomNavigationBar(
        currentIndex: pagina,
        onTap: (index){
          setState(() {
            pagina = index;
          });
        },
        backgroundColor: const Color.fromRGBO(55, 57, 84, 1.0),
        selectedItemColor: Colors.pinkAccent,
        showSelectedLabels: true,
        iconSize: 30.0,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.add_alert),label: 'Populares',backgroundColor: Colors.pinkAccent),
          BottomNavigationBarItem(icon: Icon(Icons.list),label: 'Categorias'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'Login'),
        ],
      ),
    );
  }
}
