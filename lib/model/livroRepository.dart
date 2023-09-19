import 'package:flutter_application_listview/model/livro.dart';

class LivroRepository {

  static final _listaLivros = [
      Livro(67, "Harry Potter e a Pedra Filosofal"),
      Livro(45, "Crepúsculo"),
      Livro(23, "O Senhor dos Anéis"),
      Livro(56, "O Pequeno Príncipe"),
      Livro(89, "O Diário de Anne Frank"),
      
    ];
  
  LivroRepository();

  void adicionar (Livro livro){
    _listaLivros.add(livro);
  }
  
  static void remover (Livro livro){
    _listaLivros.remove(livro);
  }

  static List <Livro> get getLivros => _listaLivros;

  void imprimir (){
    for (var i = 0; i < _listaLivros.length; i++){
      print ("Preço: ${_listaLivros[i].preco}, Nome: ${_listaLivros[i].nome}");
    }

    print("================================================");
  }



}