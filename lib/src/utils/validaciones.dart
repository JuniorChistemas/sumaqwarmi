import 'package:flutter/material.dart';

bool numero(String valor){
  if(valor.isEmpty) return false;
  final n = num.tryParse(valor);
  return (n==null)?false:true;
}

void mostrarAlerta(BuildContext context,String mensaje){
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text('informacion incorrecta'),
            content: Text(mensaje),
            actions:<Widget> [
              TextButton(
                child: Text('ok'),
                onPressed: ()=>Navigator.of(context).pop(),
              )
            ],
        );
      },
  );
}