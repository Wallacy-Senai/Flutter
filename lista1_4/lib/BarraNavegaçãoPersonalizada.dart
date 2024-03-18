import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Navigation Bar', // Título da aplicação
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(), // Define a página inicial como MyHomePage
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Índice da aba selecionada

  // Lista de widgets correspondentes a cada aba
  static List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Search Page'),
    Text('Profile Page'),
  ];

  // Função para lidar com a seleção de uma aba
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice da aba selecionada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Navigation Bar'), // Título da barra de navegação
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // Exibe o widget da aba selecionada
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // Ícones e rótulos para cada item da barra de navegação
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ícone da página inicial
            label: 'Home', // Rótulo da página inicial
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), // Ícone da página de busca
            label: 'Search', // Rótulo da página de busca
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ícone da página de perfil
            label: 'Profile', // Rótulo da página de perfil
          ),
        ],
        currentIndex: _selectedIndex, // Índice do item selecionado
        selectedItemColor: Colors.blue, // Cor do item selecionado
        onTap: _onItemTapped, // Função chamada quando um item é tocado
      ),
    );
  }
}
