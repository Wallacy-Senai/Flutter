class Usuario {
  //atributos
  late int ?id;
  String nome;
  String email;
  String senha;
  //Construtor
  Usuario({required this.nome, required this.email, required this.senha, required this.id});

  Map<String, dynamic> toMap() {
    return {
      'u_nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['u_nome'],
      email: map['email'],
      senha: map['senha'],
    );
  }
}

class Tarefa {
  // Atributos da tarefa
  late int ?id;
  String titulo;
  String descricao;
  bool concluida;

  // Construtor
  Tarefa({
    required this.titulo,
    required this.descricao,
    this.concluida = false,
    required this.id,
  });

  // Método para converter a tarefa em um mapa
  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'concluida': concluida ? 1 : 0, // Armazena como 1 se concluída, 0 se não
    };
  }

  // Fábrica para criar uma tarefa a partir de um mapa
  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'],
      titulo: map['titulo'],
      descricao: map['descricao'],
      concluida: map['concluida'] == 1, // Converte de 1 para true, 0 para false
    );
  }
}
