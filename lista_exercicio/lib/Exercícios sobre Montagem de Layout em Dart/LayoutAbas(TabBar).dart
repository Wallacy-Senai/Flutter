import 'package:flutter/material.dart'; // Importa o pacote do Flutter

void main() {
  runApp(MyApp()); // Função principal que inicializa o aplicativo Flutter
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabs Demo', // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor primária do tema
      ),
      home: MyTabs(), // Define a página inicial do aplicativo como MyTabs
    );
  }
}

class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState(); // Cria o estado do widget MyTabs
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController; // Controlador de abas

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Inicializa o controlador de abas com 3 abas e um objeto vsync
  }

  @override
  void dispose() {
    _tabController.dispose(); // Descarta o controlador de abas quando não for mais necessário
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Demo'), // Título da barra de aplicativos
        bottom: TabBar(
          controller: _tabController, // Controlador de abas
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'), // Primeira aba com ícone e texto
            Tab(icon: Icon(Icons.info), text: 'Info'), // Segunda aba com ícone e texto
            Tab(icon: Icon(Icons.settings), text: 'Settings'), // Terceira aba com ícone e texto
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController, // Controlador de abas
        children: [
          Center(child: Text('Home Tab Content')), // Conteúdo da primeira aba
          Center(child: Text('Info Tab Content')), // Conteúdo da segunda aba
          Center(child: Text('Settings Tab Content')), // Conteúdo da terceira aba
        ],
      ),
    );
  }
}
