import 'package:flutter/material.dart';
import 'package:flutter_application_listview/model/livroRepository.dart';
import 'package:flutter_application_listview/paginas/alterar.dart';

import '../model/livro.dart';


class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}


class _ListaPageState extends State<ListaPage> {

  final listaLivros = LivroRepository.getLivros;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(title: Text("Lista de Livros Cadastrados", textAlign: TextAlign.center, style: TextStyle(fontSize: 28, color: Colors.indigo, fontWeight:FontWeight.bold), ), actions: [
      ],),
      body: 
       Column(
         children: [ListView.separated(
          shrinkWrap: true,
          itemCount: listaLivros.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("${listaLivros[index].nome}", style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight:FontWeight.bold)),
              subtitle: Text("Preço: ${listaLivros[index].preco},00"),
              leading: CircleAvatar (child: Text(listaLivros[index].nome[0], style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight:FontWeight.bold))),
              trailing: SizedBox( width: 70,
              child: Row( children: [
                Expanded(child: IconButton(onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return Alterar(listaLivros[index], index);
                  },));

                }, icon: Icon(Icons.edit, color: Colors.indigo,))),
                Expanded(child: IconButton(onPressed: () {
                  Livro livro = listaLivros[index];
                  LivroRepository.remover(livro);
                  setState(() {
                    
                  });
                }, icon: Icon(Icons.delete, color: Colors.indigo,))),
                
              ],
              ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(thickness: 4),
          ),
          SizedBox(height: 20),

          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/');
          }, child: Text("Voltar", style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight:FontWeight.bold),), style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 10, shadowColor: Colors.indigo, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),),
          
          ]
       )
    
      // body: ListView.separated (
      //   separatorBuilder: (BuildContext context, int index) => Divider(thickness: 4),
      //   itemCount: lista.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       title: Text(lista[index].nome),
      //       subtitle: Text(lista[index].preco.toString()),
      //       leading: (Icon(Icons.abc)),
      //       trailing: Icon(Icons.ac_unit),
      //     );
      //   }, 
      // ),
    );
  }
}