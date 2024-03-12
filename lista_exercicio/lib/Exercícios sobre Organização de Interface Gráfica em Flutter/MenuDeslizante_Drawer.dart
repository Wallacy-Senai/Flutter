import 'package:flutter/material.dart'; // Importa o pacote Flutter Material

void main() {
  runApp(MyApp()); // Inicia o aplicativo Flutter
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Menu Example', // Define o título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor principal do tema
      ),
      home: HomePage(), // Define a página inicial como HomePage
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Menu Example'), // Define o título da barra de aplicativos
      ),
      drawer: Drawer( // Define o Drawer (menu deslizante)
        child: ListView( // Cria uma lista dentro do Drawer
          padding: EdgeInsets.zero, // Define o preenchimento como zero
          children: <Widget>[
            DrawerHeader( // Cabeçalho do Drawer
              decoration: BoxDecoration(
                color: Colors.blue, // Define a cor de fundo do cabeçalho
              ),
              child: Text(
                'Menu', // Texto exibido no cabeçalho do Drawer
                style: TextStyle(
                  color: Colors.white, // Define a cor do texto
                  fontSize: 24, // Define o tamanho da fonte
                ),
              ),
            ),
            ListTile( // Item de menu 1
              title: Text('Item 1'), // Texto exibido para o item 1
              onTap: () {
                // Função chamada quando o item 1 é tocado
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
            ListTile( // Item de menu 2
              title: Text('Item 2'), // Texto exibido para o item 2
              onTap: () {
                // Função chamada quando o item 2 é tocado
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
            // Adicione mais itens conforme necessário
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Página Principal', // Texto exibido na página principal
          style: TextStyle(fontSize: 24), // Define o estilo do texto
        ),
      ),
    );
  }
}
