import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sumaqwarmi2/src/bloc/validador.dart';
class LoginBloc with Validador{
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream.transform(validarGmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validadPassword);


  Stream<bool> get forValStream => CombineLatestStream.
  combine2(emailStream, passwordStream, (a, b) => true);


  //insertar valores

  Function(String) get changeGmail => _emailController.sink.add;
  Function(String) get changePassword =>_passwordController.sink.add;


  //obtener el ultimo valor

  String get getEmail => _emailController.value;
  String get getPassword => _passwordController.value;
  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}