import 'package:flutter/material.dart';  // Importa o pacote/material.dart que contém widgets e ferramentas para criar aplicativos Flutter.

void main() {  // Função principal que inicia o aplicativo Flutter.
  runApp(MyApp());  // Executa a função runApp() passando uma instância de MyApp como argumento para iniciar o aplicativo.
}

class MyApp extends StatelessWidget {  // Classe MyApp, que é um widget StatelessWidget, que não pode ser alterado após ser construído.
  // Lista fictícia de itens
  final List<String> items = [  // Declara uma lista de strings que representam os itens da lista.
    'RC',
    'LC',
    'FC',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  @override
  Widget build(BuildContext context) {  // Método build() que retorna o widget principal do aplicativo.
    return MaterialApp(  // Retorna um MaterialApp, que é um widget que configura o aplicativo com o estilo Material Design.
      home: Scaffold(  // Configura a tela principal do aplicativo com um Scaffold, que fornece uma estrutura básica para layouts de aplicativos.
        appBar: AppBar(  // Configura a barra de título do aplicativo.
          title: Text('Lista Dinâmica com ListView.builder'),  // Define o texto exibido na barra de título.
        ),
        body: ListView.builder(  // Cria uma lista de itens dinâmica usando o ListView.builder.
          itemCount: items.length,  // Define o número de itens na lista.
          itemBuilder: (context, index) {  // Função que constrói cada item da lista dinamicamente.
            return Card(  // Retorna um Card para cada item da lista.
              margin: EdgeInsets.all(8.0),  // Define a margem ao redor do Card.
              child: ListTile(  // Widget ListTile que exibe o conteúdo de cada item da lista.
                title: Text(items[index]),  // Define o texto principal do item.
                subtitle: Text('Descrição do Item ${index + 1}'),  // Define a descrição do item.
                leading: CircleAvatar(  // Define um ícone à esquerda do item.
                  backgroundColor: Colors.blue,  // Define a cor de fundo do ícone.
                  child: Text('${index + 1}'),  // Define o texto do ícone.
                ),
                onTap: () {  // Define uma ação ao tocar no item.
                  print('Item ${index + 1} selecionado');  // Exibe uma mensagem no console quando o item é tocado.
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
