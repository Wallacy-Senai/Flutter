import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView com Cards', // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyListViewPage(), // Define a página inicial como MyListViewPage
    );
  }
}

class MyListViewPage extends StatelessWidget {
  // Lista de itens fictícios
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView com Cards'), // Título da barra de aplicativos
      ),
      body: ListView.builder(
        itemCount: items.length, // Número total de itens no ListView
        itemBuilder: (context, index) {
          return Card( // Cria um card para cada item
            margin: EdgeInsets.all(8.0), // Define a margem do card
            child: ListTile(
              leading: Icon(Icons.star), // Ícone à esquerda do título
              title: Text(items[index]), // Título do item
              subtitle: Text('Descrição fictícia do item ${index + 1}'), // Descrição do item
              onTap: () {
                // Aqui você pode adicionar ações quando um item é clicado
              },
            ),
          );
        },
      ),
    );
  }
}
