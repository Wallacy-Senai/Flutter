import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Progress Bar', // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(), // Definindo a página inicial como MyHomePage
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _progressValue = 0.0; // Valor inicial da barra de progresso

  void _startTask() {
    // Função para iniciar uma tarefa simulada
    for (var progress = 0.1; progress <= 1.0; progress += 0.1) {
      // Loop para simular progresso
      Future.delayed(Duration(seconds: 1), () {
        // Delay para simular o tempo de uma tarefa
        setState(() {
          // Atualizando o estado da tela
          _progressValue = progress; // Atualizando o valor da barra de progresso
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Progress Bar'), // Título da barra de aplicativos
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              // Barra de progresso circular
              value: _progressValue, // Valor da barra de progresso
              backgroundColor: Colors.grey, // Cor de fundo da barra de progresso
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Cor do preenchimento da barra de progresso
            ),
            SizedBox(height: 20), // Espaçamento entre a barra de progresso e o botão
            ElevatedButton(
              onPressed: _startTask, // Função chamada quando o botão é pressionado
              child: Text('Start Task'), // Texto exibido no botão
            ),
          ],
        ),
      ),
    );
  }
}