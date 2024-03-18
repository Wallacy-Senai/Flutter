import 'package:flutter/material.dart'; // Importação do pacote flutter/material para acesso aos widgets do Flutter
import 'package:http/http.dart'; // Importação do pacote http para carregar imagens de URLs externas

void main() {
  runApp(MyApp()); // Função principal que inicializa o aplicativo Flutter
}

class MyApp extends StatelessWidget { // Classe que define o aplicativo Flutter
  @override
  Widget build(BuildContext context) { // Método que constrói a interface do aplicativo
    return MaterialApp( // Retorna um MaterialApp, que é um widget que configura o design básico do aplicativo
      title: 'Image Integration', // Título do aplicativo
      theme: ThemeData( // Tema do aplicativo
        primarySwatch: Colors.blue, // Cor principal do aplicativo
      ),
      home: ImageScreen(), // Define a tela inicial do aplicativo como ImageScreen
    );
  }
}

class ImageScreen extends StatefulWidget { // Classe que define a tela que exibe as imagens
  @override
  _ImageScreenState createState() => _ImageScreenState(); // Cria uma instância do estado da tela de imagens
}

class _ImageScreenState extends State<ImageScreen> { // Classe que define o estado da tela de imagens
  String imageUrl = "https://via.placeholder.com/150"; // URL de exemplo para uma imagem externa
  String localImageUrl = "assets/images/local_image.png"; // Caminho para a imagem local

  @override
  Widget build(BuildContext context) { // Método que constrói a interface da tela de imagens
    return Scaffold( // Retorna um Scaffold, que é um layout de tela básico do Material Design
      appBar: AppBar( // Barra de aplicativos que exibe o título da tela
        title: Text("Image Integration"), // Título da barra de aplicativos
      ),
      body: Center( // Corpo da tela centralizado
        child: Column( // Coluna de widgets
          mainAxisAlignment: MainAxisAlignment.center, // Alinhamento principal ao centro
          children: <Widget>[ // Lista de widgets filhos da coluna
            Image.network( // Widget Image para carregar uma imagem de uma URL externa
              imageUrl, // URL da imagem
              width: 150, // Largura da imagem
              height: 150, // Altura da imagem
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) { // Construtor de carregamento para exibir um indicador de progresso
                if (loadingProgress == null) { // Verifica se o progresso de carregamento é nulo
                  return child; // Retorna a imagem se o carregamento estiver concluído
                } else {
                  return CircularProgressIndicator( // Retorna um indicador de progresso circular se o carregamento estiver em andamento
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  );
                }
              },
            ),
            SizedBox(height: 20), // Espaço em branco entre as imagens
            Image.asset( // Widget Image para carregar uma imagem de recursos locais
              localImageUrl, // Caminho da imagem local
              width: 150, // Largura da imagem
              height: 150, // Altura da imagem
            ),
          ],
        ),
      ),
    );
  }
}
