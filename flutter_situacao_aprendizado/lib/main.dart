import 'package:flutter/material.dart';

// Importe as suas telas personalizadas aqui
import 'login_page.dart';
import 'register_page.dart';
import 'settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Defina o tema do seu aplicativo aqui
        // Por exemplo, você pode definir cores, fontes, etc.
        primarySwatch: Colors.blue,
      ),
      // Defina as rotas para suas telas aqui
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
