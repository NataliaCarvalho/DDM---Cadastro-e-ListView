import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 100),
          Text(
            "Seja bem-vindo!",
            style: TextStyle(
                fontSize: 28,
                color: Colors.indigo,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          SizedBox(
              width: 300,
              height: 3,
              child: Container(color: Colors.indigo[200])),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.library_books_outlined,
                color: Colors.indigo,
                size: 50,
              ),
              SizedBox(width: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ListaPage');
                },
                child: Text("Livros Cadastrados", style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight:FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber[100],
                    elevation: 10,
                    shadowColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outlined,
                color: Colors.indigo,
                size: 50,
              ),
              SizedBox(width: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                child: Text("Cadastrar Livro", style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight:FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber[100],
                    elevation: 10,
                    shadowColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
