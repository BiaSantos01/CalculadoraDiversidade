import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Variáveis para armazenar os valores dos operandos
  double _value1 = 0;
  double _value2 = 0;
  double _value3 = 0;
  double _value4 = 0;
  double _value5 = 0;

  // Variável para armazenar o resultado das operações
  double _result = 0;

  // Função para calcular o Índice de Shannon
  void _Calcular() {
    int homo = _value1.toInt();
    int hetero = _value2.toInt();
    int bi = _value3.toInt();
    int pan = _value4.toInt();
    int asexual = _value5.toInt();

    int totalIndividuals = homo + hetero + bi + pan + asexual;

    if (totalIndividuals == 0) {
      setState(() {
        _result = 0;
      });
      return;
    }

    double piHomo = homo / totalIndividuals;
    double piHetero = hetero / totalIndividuals;
    double piBi = bi / totalIndividuals;
    double piPan = pan / totalIndividuals;
    double piAsexual = asexual / totalIndividuals;

    double shannonIndex = -(piHomo * log(piHomo) +
        piHetero * log(piHetero) +
        piBi * log(piBi) +
        piPan * log(piPan) +
        piAsexual * log(piAsexual));

    // Verificar se algum pi é zero para evitar NaN
    shannonIndex = (homo == 0 ? 0 : piHomo * log(piHomo)) +
        (hetero == 0 ? 0 : piHetero * log(piHetero)) +
        (bi == 0 ? 0 : piBi * log(piBi)) +
        (pan == 0 ? 0 : piPan * log(piPan)) +
        (asexual == 0 ? 0 : piAsexual * log(piAsexual));

    setState(() {
      _result = -shannonIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              'Calculadora de Diversidade - Beatriz de Oliveira Santos 2ºC'),
          backgroundColor: Color.fromARGB(255, 140, 50, 193)),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Campo de entrada para o primeiro operando
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Digite a população homossexual'),
              onChanged: (value) {
                _value1 = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Digite a população heterossexual'),
              onChanged: (value) {
                _value2 = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Digite a população bissexual'),
              onChanged: (value) {
                _value3 = double.tryParse(value) ?? 0;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Digite a população pansexual'),
              onChanged: (value) {
                _value4 = double.tryParse(value) ?? 0;
              },
            ),
            // Campo de entrada para o segundo operando
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Digite a população assexual'),
              onChanged: (value) {
                _value5 = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Botões para realizar as operações
            SizedBox(height: 2.0),
            ElevatedButton(
              onPressed: _Calcular,
              child: Text('Calcular'),
            ),
            SizedBox(height: 2.0),
            // Exibição do resultado
            Text(
              'Índice de diversidade de Shannon: $_result',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
