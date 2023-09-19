import 'package:flutter/material.dart';
import 'package:flutter_application_listview/model/livro.dart';
import 'package:flutter_application_listview/model/livroRepository.dart';

class Alterar extends StatefulWidget {
  
  Livro livro;
  int indice;

  Alterar(this.livro, this.indice, {super.key});

  @override
  State<Alterar> createState() => _AlterarState();
}

class _AlterarState extends State<Alterar> {
  final TextEditingController _campoPreco = TextEditingController();
  final TextEditingController _campoNome = TextEditingController();
  List listaLivros = LivroRepository.getLivros;

  @override
  Widget build(BuildContext context) {
    
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    LivroRepository _livRepo = new LivroRepository();
    inicializa();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Alteração de Livros",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28,
                color: Colors.indigo,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.amber[100],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Preencha os campos:",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _campoNome,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, digite o título do livro';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Título',
                          border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                          ),
                          fillColor: Colors.indigo[200],
                          filled: true,

                        ),
                        
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _campoPreco,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, digite o preço';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Preço',
                          border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                          ),
                          fillColor: Colors.indigo[200],
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ListaPage');
                    },
                    child: Text(
                      'Voltar',
                      style: TextStyle(fontSize: 20, color: Colors.indigo),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber[100],
                        elevation: 10,
                        shadowColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        num preco = num.parse(_campoPreco.text);
                        String nome = _campoNome.text;
                        Livro l = new Livro(preco, nome);
                        listaLivros[widget.indice] = l;

                        limpaCampos();
                      }
                    },
                    child: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 20, color: Colors.indigo),
                      textAlign: TextAlign.center,
                    ),
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
          ),
        )
      );


  }

  void inicializa(){
    _campoNome.text = widget.livro.nome;
    _campoPreco.text = widget.livro.preco.toString();
  }

  void limpaCampos() {
    _campoNome.clear();
    _campoPreco.clear();
  }
}