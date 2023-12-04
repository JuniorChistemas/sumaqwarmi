import 'dart:async';

import 'package:sumaqwarmi2/src/bloc/validador.dart';
class LoginBloc with Validador{
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  Stream<String> get emailStream => _emailController.stream.transform(validarGmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validadPassword);

  //insertar valores

  Function(String) get changeGmail => _emailController.sink.add;
  Function(String) get changePassword =>_passwordController.sink.add;

  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}