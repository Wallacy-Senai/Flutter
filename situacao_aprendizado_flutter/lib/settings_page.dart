// import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart'; // Importe o flutter_colorpicker

// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   // Variáveis de estado para configurar as preferências do usuário
//   bool _darkMode = false; // Define se o modo escuro está ativado
//   double _fontSize = 16.0; // Define o tamanho da fonte
//   Color _fontColor = Colors.black; // Define a cor da fonte

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'), // Define o título da barra de navegação como "Settings"
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Configuração do modo escuro
//             Text(
//               'Dark Mode', // Título do controle de modo escuro
//               style: TextStyle(fontSize: 20.0), // Define o tamanho da fonte
//             ),
//             Switch(
//               value: _darkMode, // Valor atual do modo escuro
//               onChanged: (value) {
//                 setState(() {
//                   _darkMode = value; // Atualiza o estado do modo escuro quando alterado
//                 });
//               },
//             ),
//             SizedBox(height: 20.0),
//             // Configuração do tamanho da fonte
//             Text(
//               'Font Size', // Título do controle de tamanho da fonte
//               style: TextStyle(fontSize: 20.0), // Define o tamanho da fonte
//             ),
//             Slider(
//               value: _fontSize, // Valor atual do tamanho da fonte
//               min: 12.0, // Tamanho mínimo da fonte
//               max: 24.0, // Tamanho máximo da fonte
//               divisions: 12, // Número de divisões do controle deslizante
//               onChanged: (value) {
//                 setState(() {
//                   _fontSize = value; // Atualiza o tamanho da fonte quando alterado
//                 });
//               },
//             ),
//             SizedBox(height: 20.0),
//             // Configuração da cor da fonte
//             Text(
//               'Font Color', // Título do controle de cor da fonte
//               style: TextStyle(fontSize: 20.0), // Define o tamanho da fonte
//             ),
//             SizedBox(height: 10.0),
//             GestureDetector(
//               onTap: () {
//                 _selectFontColor(context); // Abre o seletor de cores ao tocar no contêiner
//               },
//               child: Container(
//                 width: 50.0,
//                 height: 50.0,
//                 color: _fontColor, // Define a cor do contêiner como a cor da fonte selecionada
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Método para selecionar a cor da fonte
//   void _selectFontColor(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Font Color'), // Título do diálogo de seleção de cor da fonte
//           content: SingleChildScrollView(
//             child: ColorPicker(
//               pickerColor: _fontColor, // Define a cor atual do seletor de cores como a cor da fonte
//               onColorChanged: (color) {
//                 setState(() {
//                   _fontColor = color; // Atualiza a cor da fonte quando alterada
//                 });
//               },
//               enableAlpha: false, // Desativar o canal alfa para cores opacas
//               showLabel: true, // Mostrar rótulos de cores para facilitar a seleção
//               pickerAreaHeightPercent: 0.8, // Define a altura do seletor de cores
//             ),
//           ),
//           actions: <Widget>[
//             // Botão para fechar o diálogo de seleção de cor
//             TextButton(
//               child: Text('OK'), // Texto do botão de confirmação
//               onPressed: () {
//                 Navigator.of(context).pop(); // Fecha o diálogo de seleção de cor
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
