import 'package:flutter/material.dart'; // Importa o pacote/material.dart que contém widgets e ferramentas para criar aplicativos Flutter.

void main() {
  runApp(MyApp()); // Função principal que inicia o aplicativo Flutter.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // Método build() que retorna o widget principal do aplicativo.
    return MaterialApp(
      title: 'Barra de Navegação', // Define o título do aplicativo.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor primária do tema do aplicativo.
      ),
      home: NavigationBar(), // Define a tela inicial como a barra de navegação.
    );
  }
}

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState(); // Cria o estado da barra de navegação.
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0; // Índice do item selecionado na barra de navegação.

  // Lista de telas correspondentes a cada item da barra de navegação.
  final List<Widget> _screens = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  // Função para atualizar a tela ao selecionar um novo item na barra de navegação.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice do item selecionado.
    });
  }

  @override
  Widget build(BuildContext context) { // Método build() que retorna a estrutura da barra de navegação.
    return Scaffold(
      appBar: AppBar(
        title: Text('Barra de Navegação'), // Define o título da barra de navegação.
      ),
      body: _screens[_selectedIndex], // Exibe a tela correspondente ao item selecionado.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Índice do item selecionado na barra de navegação.
        onTap: _onItemTapped, // Função chamada ao selecionar um item na barra de navegação.
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tela 1', // Rótulo do primeiro item da barra de navegação.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tela 2', // Rótulo do segundo item da barra de navegação.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tela 3', // Rótulo do terceiro item da barra de navegação.
          ),
        ],
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // Método build() que retorna a estrutura da tela 1.
    return Center(
      child: Text(
        'Tela 1',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // Método build() que retorna a estrutura da tela 2.
    return Center(
      child: Text(
        'Tela 2',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // Método build() que retorna a estrutura da tela 3.
    return Center(
      child: Text(
        'Tela 3',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
