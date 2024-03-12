import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Jogo_da_sorte(),
    );
  }
}

class Jogo_da_sorte extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _JogoDaSorteState createState() => _JogoDaSorteState();
}

class _JogoDaSorteState extends State<Jogo_da_sorte> {
  TextEditingController _controllerNumero = TextEditingController();
  String _resultado = '';
  int _tentativas = 10;
  int _numeroSorteado = Random().nextInt(100) + 1;
  bool _jogoEncerrado = false;

  void _Jogar(String operacao) {
    if (!_jogoEncerrado) {
      int numeroEscolhido = int.tryParse(_controllerNumero.text) ?? 0;

      if (_tentativas > 0) {
        _tentativas--;
      }
      if (numeroEscolhido == _numeroSorteado) {
        setState(() {
          _resultado =
              'Parabéns! Você acertou o número sorteado: $_numeroSorteado';
          _jogoEncerrado = true;
        });
        return;
      } else {
        setState(() {
          if (_tentativas > 0) {
            _resultado =
                'Que pena! Tente novamente. Tentativas restantes: $_tentativas';
          } else {
            _resultado =
                'Suas tentativas acabaram. O numero era: $_numeroSorteado';
            _jogoEncerrado = true;
          }
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Jogo da Sorte'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _controllerNumero,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Escolha um número entre 1 e 100'),
              ),
              SizedBox(height: 10.0), // Espaçamento vertical
              ElevatedButton(
                // Botão para somar
                onPressed: () =>
                    _Jogar('Jogar'), // Função a ser executada ao clicar
                child: Text('Jogar'), // Texto do botão
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () => _Jogar('Jogar'),
                child: Text('Reiniciar Jogo'),
              ),
              SizedBox(height: 16.0),
              Text(_resultado,
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
