import 'package:flutter/material.dart';
import 'package:flutter_application_listview/home.dart';
import 'package:flutter_application_listview/list.dart';
import 'package:flutter_application_listview/cadastro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const Home(),
        '/cadastro': (context) => const Cadastro(),
        '/ListaPage': (context) => const ListaPage(),
      },
    );
  }
}