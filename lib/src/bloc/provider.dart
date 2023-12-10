import 'package:flutter/material.dart';


import 'package:sumaqwarmi2/src/bloc/loginBloc.dart';
export 'package:sumaqwarmi2/src/bloc/loginBloc.dart';

import 'package:sumaqwarmi2/src/bloc/productoBloc.dart';
export 'package:sumaqwarmi2/src/bloc/productoBloc.dart';

class Provider extends InheritedWidget{
  //instancia para la clase LoginBloc
  final loginBloc = LoginBloc();

  final _productoBloc = new ProductoBloc();

  Provider({Key? key,required Widget child})
    : super(key: key,child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
  static LoginBloc of(BuildContext context){
    print('entre aqui en la funcion');
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).loginBloc;
  }
  static ProductoBloc productosBloc(BuildContext context){
    print('entre aqui en la funcion');
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)._productoBloc;
  }

}