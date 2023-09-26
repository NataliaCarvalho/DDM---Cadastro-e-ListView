import 'package:flutter/material.dart';
import 'package:flutter_application_listview/paginas/alterar.dart';
import 'package:flutter_application_listview/paginas/home.dart';
import 'package:flutter_application_listview/paginas/list.dart';
import 'package:flutter_application_listview/paginas/cadastro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const Home(),
        '/cadastro': (context) => const Cadastro(),
        '/ListaPage': (context) => const ListaPage(),
        //'/alterar':(context) => const Alterar(),
      },
    );
  }
}