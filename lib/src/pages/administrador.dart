import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/bloc/provider.dart';
class AdministradorPage extends StatelessWidget {
  const AdministradorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrador'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget> [
          Text('holita'),

        ],
      ),
    );
  }
}
