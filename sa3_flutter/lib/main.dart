// Importa o pacote flutter/material.dart, que contém os widgets e utilidades do Flutter
import 'package:flutter/material.dart';

// Importa a classe PaginaLogin do arquivo LoginPageView.dart
import 'View/LoginPageView.dart';

// Função principal que é executada quando o aplicativo é iniciado
void main() {
  // Inicia a aplicação, passando o widget MyApp como raiz
  runApp(MyApp());
}

// Classe MyApp, que é um widget StatelessWidget
class MyApp extends StatelessWidget {
  // Construtor da classe MyApp
  const MyApp({super.key});

  // Método build, que retorna o widget principal da aplicação
  @override
  Widget build(BuildContext context) {
    // Retorna um MaterialApp, que é um widget que configura o estilo básico da aplicação
    return MaterialApp(
      // Define o título da aplicação
      title: "SA3",
      // Define se a faixa de debug deve ser exibida na parte superior da tela
      debugShowCheckedModeBanner: false,
      // Define a tela inicial da aplicação como PaginaLogin, que está definida no arquivo LoginPageView.dart
      home: PaginaLogin(),
    );
  }
}
