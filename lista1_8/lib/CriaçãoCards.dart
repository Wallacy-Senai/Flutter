import 'package:flutter/material.dart'; // Importa o pacote Material do Flutter

void main() {
  runApp(MyApp()); // Inicializa o aplicativo Flutter
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Cards', // Define o título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor primária do tema
      ),
      home: ProductCardsPage(), // Define a tela inicial como ProductCardsPage
    );
  }
}

class ProductCardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Cards'), // Define o título da barra de aplicativos
      ),
      body: ListView( // Cria uma ListView para exibir os cards de produtos
        padding: EdgeInsets.all(16.0), // Define o preenchimento dentro da ListView
        children: [
          ProductCard( // Adiciona o primeiro card de produto
            image: 'https://via.placeholder.com/150', // URL da imagem do produto
            title: 'Product 1', // Título do produto
            description: 'Description for Product 1', // Descrição do produto
          ),
          ProductCard( // Adiciona o segundo card de produto
            image: 'https://via.placeholder.com/150', // URL da imagem do produto
            title: 'Product 2', // Título do produto
            description: 'Description for Product 2', // Descrição do produto
          ),
          ProductCard( // Adiciona o terceiro card de produto
            image: 'https://via.placeholder.com/150', // URL da imagem do produto
            title: 'Product 3', // Título do produto
            description: 'Description for Product 3', // Descrição do produto
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image; // URL da imagem do produto
  final String title; // Título do produto
  final String description; // Descrição do produto

  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, // Define a elevação do card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image, // Exibe a imagem do produto a partir da URL fornecida
            height: 150, // Define a altura da imagem
            width: double.infinity, // Define a largura da imagem como a largura máxima possível
            fit: BoxFit.cover, // Define como a imagem deve ser ajustada dentro do espaço disponível
          ),
          Padding(
            padding: EdgeInsets.all(8.0), // Define o preenchimento dentro do card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, // Exibe o título do produto
                  style: TextStyle(
                    fontSize: 20.0, // Define o tamanho da fonte do título
                    fontWeight: FontWeight.bold, // Define o peso da fonte do título como negrito
                  ),
                ),
                SizedBox(height: 8.0), // Adiciona um espaço vertical entre o título e a descrição
                Text(description), // Exibe a descrição do produto
              ],
            ),
          ),
        ],
      ),
    );
  }
}
