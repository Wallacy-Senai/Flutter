import 'package:flutter/material.dart';  // Importa o pacote/material.dart que contém widgets e ferramentas para criar aplicativos Flutter.

void main() {  // Função principal que inicia o aplicativo Flutter.
  runApp(MyApp());  // Executa a função runApp() passando uma instância de MyApp como argumento para iniciar o aplicativo.
}

class MyApp extends StatelessWidget {  // Classe MyApp, que é um widget StatelessWidget, que não pode ser alterado após ser construído.
  @override
  Widget build(BuildContext context) {  // Método build() que retorna o widget principal do aplicativo.
    return MaterialApp(  // Retorna um MaterialApp, que é um widget que configura o aplicativo com o estilo Material Design.
      home: Scaffold(  // Configura a tela principal do aplicativo com um Scaffold, que fornece uma estrutura básica para layouts de aplicativos.
        appBar: AppBar(  // Configura a barra de título do aplicativo.
          title: Text('Exemplo de Layout em Flutter'),  // Define o texto exibido na barra de título.
        ),
        body: Center(  // Centraliza o conteúdo da tela.
          child: Container(  // Widget Container, que cria um contêiner retangular.
            padding: EdgeInsets.all(20.0),  // Adiciona um preenchimento interno ao contêiner.
            color: Colors.grey[100],  // Define a cor de fundo do contêiner como cinza claro.
            child: Column(  // Widget Column, que organiza os widgets filhos em uma coluna vertical.
              mainAxisAlignment: MainAxisAlignment.center,  // Alinha os widgets filhos verticalmente no centro.
              children: <Widget>[  // Lista de widgets filhos da Column.
                Text(  // Widget Text, que exibe texto na tela.
                  'PodPah',  // Texto exibido na tela.
                  style: TextStyle(  // Define o estilo do texto.
                    fontSize: 24.0,  // Define o tamanho da fonte do texto.
                    fontWeight: FontWeight.w900,  // Define o peso da fonte como negrito.
                  ),
                ),
                SizedBox(height: 20.0),  // Adiciona um espaço vertical entre os widgets.
                Icon(  // Widget Icon, que exibe um ícone na tela.
                  Icons.emoji_objects_sharp,  // Ícone exibido na tela.
                  size: 500.0,  // Define o tamanho do ícone.
                  color: Color.fromARGB(255, 225, 4, 245),  // Define a cor do ícone.
                ),
                SizedBox(height: 20.0),  // Adiciona um espaço vertical entre os widgets.
                Row(  // Widget Row, que organiza os widgets filhos em uma linha horizontal.
                  mainAxisAlignment: MainAxisAlignment.center,  // Alinha os widgets filhos horizontalmente no centro.
                  children: <Widget>[  // Lista de widgets filhos da Row.
                    Container(  // Widget Container que cria um contêiner retangular.
                      width: 50.0,  // Define a largura do contêiner.
                      height: 50.0,  // Define a altura do contêiner.
                      color: Colors.blue,  // Define a cor de fundo do contêiner como azul.
                      child: Center(  // Centraliza o conteúdo do contêiner.
                        child: Text(  // Widget Text, que exibe texto na tela.
                          'A',  // Texto exibido na tela.
                          style: TextStyle(  // Define o estilo do texto.
                            fontSize: 20.0,  // Define o tamanho da fonte do texto.
                            color: Colors.white,  // Define a cor do texto como branca.
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),  // Adiciona um espaço horizontal entre os widgets.
                    Container(  // Segundo contêiner semelhante ao primeiro.
                      width: 50.0,
                      height: 50.0,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          'B',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),  // Adiciona um espaço horizontal entre os widgets.
                    Container(  // Terceiro contêiner semelhante aos anteriores.
                      width: 50.0,
                      height: 50.0,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          'C',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),  // Adiciona um espaço vertical entre os widgets.
                Image.asset(  // Widget Image, que exibe uma imagem na tela.
                  'assets/flutter_logo.png',  // Caminho para o arquivo de imagem.
                  width: 150.0,  // Define a largura da imagem.
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
