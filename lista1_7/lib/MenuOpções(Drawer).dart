import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Menu Example',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor primária do aplicativo
      ),
      home: MyHomePage(), // Define a página inicial do aplicativo
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Menu Example'), // Define o título da barra de aplicativo
        // Adiciona um ícone de menu na barra de aplicativo para abrir o Drawer
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu), // Ícone de menu
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abre o Drawer quando o ícone é pressionado
              },
            );
          },
        ),
      ),
      // Adiciona o Drawer ao Scaffold
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Define o preenchimento do ListView como zero
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // Define a cor de fundo do cabeçalho do Drawer
              ),
              child: Text(
                'Opções do Menu', // Título do cabeçalho do Drawer
                style: TextStyle(
                  color: Colors.white, // Cor do texto do cabeçalho do Drawer
                  fontSize: 24, // Tamanho da fonte do texto do cabeçalho do Drawer
                ),
              ),
            ),
            ListTile(
              title: Text('Opção 1'), // Texto da primeira opção do menu
              onTap: () {
                // Adicione aqui o que você deseja fazer quando a opção 1 for selecionada
                Navigator.pop(context); // Fecha o Drawer após a opção ser selecionada
              },
            ),
            ListTile(
              title: Text('Opção 2'), // Texto da segunda opção do menu
              onTap: () {
                // Adicione aqui o que você deseja fazer quando a opção 2 for selecionada
                Navigator.pop(context); // Fecha o Drawer após a opção ser selecionada
              },
            ),
            ListTile(
              title: Text('Opção 3'), // Texto da terceira opção do menu
              onTap: () {
                // Adicione aqui o que você deseja fazer quando a opção 3 for selecionada
                Navigator.pop(context); // Fecha o Drawer após a opção ser selecionada
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Conteúdo da Página'), // Conteúdo da página principal
      ),
    );
  }
}
