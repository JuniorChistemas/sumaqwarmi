import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sumaqwarmi2/firebase_options.dart';
import 'package:sumaqwarmi2/src/bloc/provider.dart';
import 'package:sumaqwarmi2/src/pages/administrador.dart';
import 'package:sumaqwarmi2/src/pages/menu.dart';
import 'package:sumaqwarmi2/src/pages/producto.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //diseño para la parte superior del aplicativo, se adapta al aplicativo
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: const Color.fromRGBO(55, 57, 84, 1.0)));
    return Provider(
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SUMAQ WARMI',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(249,165,185,1)),
          useMaterial3: true,
        ),
        initialRoute: 'menu',
        routes: {
          'menu' : (BuildContext context) => const Menu(),
          'administrador' : (BuildContext context) => AdministradorPage(),
          'producto': (BuildContext context) =>   ProductoPage(),
        },
      ),
    );
  }
}
