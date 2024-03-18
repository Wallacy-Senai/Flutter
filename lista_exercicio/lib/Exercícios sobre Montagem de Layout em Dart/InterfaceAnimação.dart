import 'package:flutter/material.dart'; // Importa o pacote do Flutter

void main() {
  runApp(MyApp()); // Inicia o aplicativo Flutter
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animação Flutter'), // Define o título da barra de navegação
        ),
        body: AnimatedWidgetExample(), // Define o corpo do aplicativo como o exemplo de widget animado
      ),
    );
  }
}

class AnimatedWidgetExample extends StatefulWidget {
  @override
  _AnimatedWidgetExampleState createState() => _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample> {
  double _positionX = 0.0; // Variável para armazenar a posição X do widget
  double _positionY = 0.0; // Variável para armazenar a posição Y do widget

  @override
  Widget build(BuildContext context) {
    return Center( // Centraliza o widget
      child: GestureDetector( // Um detector de gestos que detecta toques no widget
        onTap: () { // Função chamada quando o widget é tocado
          setState(() { // Atualiza o estado do widget
            _positionX = 100.0; // Muda a posição X do widget quando tocado
            _positionY = 100.0; // Muda a posição Y do widget quando tocado
          });

          Future.delayed(Duration(milliseconds: 500), () { // Adiciona um atraso para a próxima alteração de estado
            setState(() { // Atualiza o estado do widget
              _positionX = 0.0; // Retorna a posição X ao normal após 500ms
              _positionY = 0.0; // Retorna a posição Y ao normal após 500ms
            });
          });
        },
        child: AnimatedContainer( // Container animado que muda suas propriedades animadamente
          duration: Duration(milliseconds: 500), // Duração da animação em milissegundos
          width: 100.0, // Largura do container
          height: 100.0, // Altura do container
          color: Colors.blue, // Cor de fundo do container
          margin: EdgeInsets.only(left: _positionX, top: _positionY), // Margem do container que é animada
          child: Center( // Centraliza o conteúdo do container
            child: Text(
              'Clique aqui', // Texto exibido dentro do container
              style: TextStyle(color: Colors.white), // Estilo do texto
            ),
          ),
        ),
      ),
    );
  }
}
