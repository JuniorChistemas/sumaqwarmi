import 'dart:async';

mixin class Validador{
  final validadPassword = StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){
      if(password.length>=6){
        sink.add(password);
      }else{
        sink.addError('contraseña debe ser mayor a 6');
      }
    }
  );

  final validarGmail = StreamTransformer<String,String>.fromHandlers(
      handleData: (gmail,sink){
        Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = new RegExp(pattern.toString());
        if(regExp.hasMatch(gmail)){
          sink.add(gmail);
        }else{
          sink.addError("correo no aceptado");
        }
      }
  );
}