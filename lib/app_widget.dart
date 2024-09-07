import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';



class AppWidget extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Álbum de Fotos',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: Modular.routerConfig,
    );
  }
}