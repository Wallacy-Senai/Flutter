import 'package:flutter/material.dart';

void main() {
  runApp(SettingsPage());
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Color _backgroundColor = Colors.white;
  Color _nameColor = Colors.black;
  double _fontSize = 16.0;

  void _applySettings() {
    // Implemente a lógica para aplicar as configurações, como salvar no SharedPreferences ou em outro local.
    // Por enquanto, vamos apenas imprimir as configurações.
    print('Cor de fundo: $_backgroundColor');
    print('Cor do nome: $_nameColor');
    print('Tamanho da fonte: $_fontSize');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Cor de Fundo:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                _buildColorOption(Colors.white),
                SizedBox(width: 10.0),
                _buildColorOption(Colors.black),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Cor do Nome:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                _buildColorOption(Colors.black),
                SizedBox(width: 10.0),
                _buildColorOption(Colors.blue),
                SizedBox(width: 10.0),
                _buildColorOption(Colors.red),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Tamanho da Fonte:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Slider(
              value: _fontSize,
              min: 10.0,
              max: 30.0,
              onChanged: (newValue) {
                setState(() {
                  _fontSize = newValue;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _applySettings,
              child: Text('Aplicar Configurações'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _backgroundColor = color;
        });
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        color: color,
      ),
    );
  }
}
