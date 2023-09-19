import 'package:flutter/material.dart';
import 'package:flutter_application_listview/model/livro.dart';
import 'package:flutter_application_listview/model/livroRepository.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _campoPreco = TextEditingController();
  final TextEditingController _campoNome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    LivroRepository _livRepo = new LivroRepository();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cadastro de Livros",
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
                      Navigator.pushNamed(context, '/');
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
                        String nome = _campoNome.text;
                        int preco = int.parse(_campoPreco.text);

                        Livro livro = Livro(preco, nome);
                        _livRepo.adicionar(livro);

                        limpaCampos();
                        confirmaCadastro();

                        _formKey.currentState!.reset();
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
        ));
  }

  void confirmaCadastro() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("O livro foi cadastrado com sucesso!")));
  }

  void limpaCampos() {
    _campoNome.clear();
    _campoPreco.clear();
  }
}
