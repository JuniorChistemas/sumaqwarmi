import 'dart:math';

import 'package:flutter/material.dart';

class FondoApp extends StatelessWidget {
  const FondoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _fondoApp();
  }
  Widget _fondoApp(){
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors:<Color> [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0),
            ],
          )
      ),
    );
    final caja = Transform.rotate(
        angle: -pi/5.0,
        child: Container(
          height: 300.0,
          width: 300.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(236, 98, 188, 1.0),
                    Color.fromRGBO(241, 142, 172, 1.0),
                  ]
              )
          ),
        )
    );
    return Stack(
      children:<Widget> [
        gradiente,
        Positioned(
          child: caja,
          top: -100,
        ),
      ],
    );
  }
}
