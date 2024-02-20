import 'package:flutter/material.dart'; // Importa o pacote Flutter Material Design
import 'dart:math'; // Importa a biblioteca padrão de Dart para operações matemáticas

void main() {
  runApp(CalculadoraApp()); // Inicia a aplicação Flutter
}

class CalculadoraApp extends StatelessWidget { // Define a classe principal do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Retorna um MaterialApp, que é o widget raiz para a aplicação Flutter
      home: Calculadora(), // Define a tela inicial como a Calculadora
    );
  }
}

class Calculadora extends StatefulWidget { // Define a classe para o estado mutável da Calculadora
  @override
  _CalculadoraState createState() => _CalculadoraState(); // Cria o estado mutável da Calculadora
}

class _CalculadoraState extends State<Calculadora> { // Define o estado mutável da Calculadora
  TextEditingController _controllerNumero1 = TextEditingController(); // Controlador para o TextField do número 1
  TextEditingController _controllerNumero2 = TextEditingController(); // Controlador para o TextField do número 2
  String _resultado = ''; // Variável para armazenar o resultado das operações

  void _calcular(String operacao) { // Método para calcular as operações
    double numero1 = double.tryParse(_controllerNumero1.text) ?? 0.0; // Obtém o valor do número 1 ou 0.0 se for inválido
    double numero2 = double.tryParse(_controllerNumero2.text) ?? 0.0; // Obtém o valor do número 2 ou 0.0 se for inválido
    double? resultado; // Variável para armazenar o resultado, podendo ser nula

    setState(() { // Atualiza o estado da interface do usuário
      if (operacao == "Somar") { // Se a operação for soma
        resultado = numero1 + numero2; // Calcula a soma
      } else if (operacao == 'Sub') { // Se a operação for subtração
        resultado = numero1 - numero2; // Calcula a subtração
      } else if (operacao == "Mult") { // Se a operação for multiplicação
        resultado = numero1 * numero2; // Calcula a multiplicação
      } else if (operacao == "Div") { // Se a operação for divisão
        resultado = numero2 != 0 ? numero1 / numero2 : resultado = null; // Calcula a divisão, verificando se o denominador é zero
      } else if (operacao == "Pot") { // Se a operação for potenciação
        resultado = pow(numero1, numero2) as double; // Calcula a potência
      } else { // Se a operação for raiz quadrada
        if(numero1>=0 && numero2%2 != 0){ // Verifica se o número é positivo e o expoente é ímpar
          resultado = pow(numero1, (1/numero2)) as double; // Calcula a raiz quadrada
        }else{ // Caso contrário
          resultado = null; // Resultado é nulo (operação inválida)
        }
      }
      _resultado = resultado != null ? 'O Resultado é $resultado' : 'operação inviavel'; // Atualiza o resultado exibido
    });
  }

  @override
  Widget build(BuildContext context) { // Método para construir a interface do usuário
    return Scaffold( // Retorna um Scaffold, que é uma estrutura básica para a tela
      appBar: AppBar( // Barra superior
        title: Text('Calculadora Flutter'), // Título da barra superior
      ),
      body: Padding( // Corpo da tela com padding
        padding: const EdgeInsets.all(16.0), // Espaçamento ao redor dos elementos
        child: Column( // Coluna de elementos
          mainAxisAlignment: MainAxisAlignment.center, // Alinhamento vertical ao centro
          crossAxisAlignment: CrossAxisAlignment.stretch, // Alinhamento horizontal esticado
          children: [ // Lista de widgets filhos
            TextField( // Campo de texto para o número 1
              controller: _controllerNumero1, // Controlador para obter o valor digitado
              keyboardType: TextInputType.number, // Tipo de teclado numérico
              decoration: InputDecoration(labelText: 'Número 1'), // Rótulo do campo de texto
            ),
            SizedBox(height: 16.0), // Espaçamento vertical
            TextField( // Campo de texto para o número 2
              controller: _controllerNumero2, // Controlador para obter o valor digitado
              keyboardType: TextInputType.number, // Tipo de teclado numérico
              decoration: InputDecoration(labelText: 'Número 2'), // Rótulo do campo de texto
            ),
            SizedBox(height: 10.0), // Espaçamento vertical
            ElevatedButton( // Botão para somar
              onPressed: () => _calcular('Somar'), // Função a ser executada ao clicar
              child: Text('Somar'), // Texto do botão
            ),
            SizedBox(height: 10.0), // Espaçamento vertical
            ElevatedButton( // Botão para subtrair
              onPressed: () => _calcular('Sub'), // Função a ser executada ao clicar
              child: Text('Subtrair'), // Texto do botão
            ),
            SizedBox(height: 10.0), // Espaçamento vertical
            ElevatedButton( // Botão para multiplicar
              onPressed: () => _calcular('Mult'), // Função a ser executada ao clicar
              child: Text('Multiplicar'), // Texto do botão
            ),
            SizedBox(height: 10.0), // Espaçamento vertical
            ElevatedButton( // Botão para dividir
              onPressed: () => _calcular('Div'), // Função a ser executada ao clicar
              child: Text('Divisão'), // Texto do botão
            ),
            SizedBox(height: 10.0), // Espaçamento vertical
            ElevatedButton( // Botão para potência
              onPressed: () => _calcular('Pot'), // Função a ser executada ao clicar
              child: Text('Potenciação'), // Texto do botão
            ),
            SizedBox(height: 10.0), // Espaçamento vertical
            ElevatedButton( // Botão para raiz quadrada
              onPressed: () => _calcular('Rai'), // Função a ser executada ao clicar
              child: Text('Raiz Quadrada'), // Texto do botão
            ),
            SizedBox(height: 16.0), // Espaçamento vertical
            Text(_resultado, // Exibe o resultado das operações
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)), // Estilo do texto
          ],
        ),
      ),
    );
  }
}
