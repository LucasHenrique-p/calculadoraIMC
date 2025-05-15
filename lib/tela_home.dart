import 'package:flutter/material.dart';
import 'tela_resultado.dart';
import 'controladora.dart';

class TelaHome extends StatefulWidget {
  @override
  _TelaHomeState createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  void calcularEIrParaResultado() {
    double peso = double.tryParse(pesoController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;

    if (peso <= 0 || altura <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Informe valores Abaixo!')));
      return;
    }

    double imc = IMCControle.calcularIMC(peso, altura);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaResultado(imc: imc)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora de IMC'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (Kg)',
                hintText: 'Ex: 70',
              ),
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (m)',
                hintText: 'Ex: 1.70',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularEIrParaResultado,
              child: Text('Calcular IMC'),
            ),
          ],
        ),
      ),
    );
  }
}
