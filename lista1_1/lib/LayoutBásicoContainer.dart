import 'package:flutter/material.dart'; // Importa o pacote/material do Flutter

void main() {
  runApp(MyApp()); // Inicia o aplicativo Flutter
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Retorna o widget MaterialApp que contém a estrutura básica do aplicativo
      home: Scaffold( // Retorna o widget Scaffold para estruturar a página
        appBar: AppBar( // Define a barra superior do aplicativo
          title: Text('Layout com Container'), // Título da barra superior
        ),
        body: Center( // Centraliza o conteúdo na tela
          child: Container( // Widget Container que contém os outros widgets
            width: 200, // Largura do Container
            height: 200, // Altura do Container
            color: Colors.grey[200], // Cor de fundo do Container (cinza claro)
            child: Column( // Coluna para organizar os widgets filhos verticalmente
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Alinha os filhos verticalmente com espaçamento uniforme
              children: [ // Lista de widgets filhos do Container
                Container( // Primeiro widget filho (Container)
                  width: 100, // Largura do primeiro Container
                  height: 50, // Altura do primeiro Container
                  color: Colors.blue, // Cor de fundo do primeiro Container (azul)
                  child: Center( // Centraliza o conteúdo do primeiro Container
                    child: Text( // Widget de texto dentro do primeiro Container
                      'Widget 1', // Texto exibido no primeiro Container
                      style: TextStyle(color: Colors.white), // Estilo do texto (cor branca)
                    ),
                  ),
                ),
                Container( // Segundo widget filho (Container)
                  width: 150, // Largura do segundo Container
                  height: 50, // Altura do segundo Container
                  color: Colors.green, // Cor de fundo do segundo Container (verde)
                  child: Center( // Centraliza o conteúdo do segundo Container
                    child: Text( // Widget de texto dentro do segundo Container
                      'Widget 2', // Texto exibido no segundo Container
                      style: TextStyle(color: Colors.white), // Estilo do texto (cor branca)
                    ),
                  ),
                ),
                Container( // Terceiro widget filho (Container)
                  width: 120, // Largura do terceiro Container
                  height: 50, // Altura do terceiro Container
                  color: Colors.orange, // Cor de fundo do terceiro Container (laranja)
                  child: Center( // Centraliza o conteúdo do terceiro Container
                    child: Text( // Widget de texto dentro do terceiro Container
                      'Widget 3', // Texto exibido no terceiro Container
                      style: TextStyle(color: Colors.white), // Estilo do texto (cor branca)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
