import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Buttons'), // Define o título da AppBar
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton( // Botão Elevado
                onPressed: () {}, // Ação quando pressionado (vazio neste exemplo)
                style: ElevatedButton.styleFrom( // Define o estilo do botão elevado
                  primary: Colors.blue, // Cor de fundo
                  onPrimary: Colors.white, // Cor do texto
                  shape: RoundedRectangleBorder( // Define a forma do botão
                    borderRadius: BorderRadius.circular(20), // Borda arredondada
                  ),
                ),
                child: Padding( // Padding ao redor do conteúdo do botão
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add), // Ícone dentro do botão
                      SizedBox(width: 5), // Espaçamento entre o ícone e o texto
                      Text('Add Item'), // Texto do botão
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Espaçamento entre os botões
              TextButton( // Botão de Texto
                onPressed: () {}, // Ação quando pressionado (vazio neste exemplo)
                style: TextButton.styleFrom( // Define o estilo do botão de texto
                  primary: Colors.red, // Cor do texto
                ),
                child: Text('Delete Item'), // Texto do botão
              ),
              SizedBox(height: 20), // Espaçamento entre os botões
              OutlinedButton( // Botão Contornado
                onPressed: () {}, // Ação quando pressionado (vazio neste exemplo)
                style: OutlinedButton.styleFrom( // Define o estilo do botão contornado
                  primary: Colors.green, // Cor do texto
                  side: BorderSide(color: Colors.green), // Cor da borda
                  shape: RoundedRectangleBorder( // Define a forma do botão
                    borderRadius: BorderRadius.circular(10), // Borda arredondada
                  ),
                ),
                child: Text('Edit Item'), // Texto do botão
              ),
            ],
          ),
        ),
      ),
    );
  }
}
