import 'package:analyseur_live_flutter_5octobre/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // cette propriété permet d'enlever la bannière
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // on a crée un nouveau widget pour notre page qui est dans un fichier séparé 
      home: HomePage(),
    );
  }
}

