class Livro {
  num _preco = 0;
  String _nome = "";

  num get preco => this._preco;

 set preco(num value) => this._preco = value;

 get nome => this._nome;

 set nome( value) => this._nome = value;

 Livro (this._preco, this._nome);
}