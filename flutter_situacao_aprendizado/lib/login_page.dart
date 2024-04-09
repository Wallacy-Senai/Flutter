import 'package:flutter/material.dart';
import 'banco_de_dados.dart';

class PaginaLogin extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            ElevatedButton(
              child: Text('Entrar'),
              onPressed: () async {
                final String email = emailController.text;
                final String senha = senhaController.text;

                final List<Usuario> usuarios = await BancoDeDados.getUsuarios();
                final usuarioEncontrado = usuarios.firstWhere(
                  (usuario) => usuario.email == email && usuario.senha == senha,
                  orElse: () => null,
                );

                if (usuarioEncontrado != null) {
                  // Navegar para a próxima página
                } else {
                  // Mostrar erro
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
