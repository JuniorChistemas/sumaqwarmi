import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/bloc/loginBloc.dart';
export 'package:sumaqwarmi2/src/bloc/loginBloc.dart';
class Provider extends InheritedWidget{
  //instancia para la clase LoginBloc
  final loginBloc = LoginBloc();
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

}