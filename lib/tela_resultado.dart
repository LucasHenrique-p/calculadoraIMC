import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  final double imc;

  TelaResultado({required this.imc});

  String interpretarIMC() {
    if (imc < 18.5) {
      return 'MAGREZA';
    } else if (imc >= 18.5 && imc <= 24.9) {
      return 'NORMAL';
    } else if (imc >= 25 && imc <= 29.9) {
      return 'SOBREPESO';
    } else if (imc >= 30 && imc < 39.9) {
      return 'OBESIDADE';
    } else if (imc >= 40) {
      return 'OBESIDADE GRAVE';
    }
    return 'VALOR INVÁLIDO';
  }

  // 👉 Método que retorna a cor conforme o IMC
  Color corIMC() {
    if (imc < 18.5) {
      return Colors.blue; // magreza
    } else if (imc >= 18.5 && imc <= 24.9) {
      return Colors.green; // normal
    } else if (imc >= 25 && imc <= 29.9) {
      return Colors.orange; // sobrepeso
    } else if (imc >= 30 && imc < 39.9) {
      return Colors.red; // obesidade
    } else if (imc >= 40) {
      return Colors.purple; // obesidade grave
    }
    return Colors.black; // valor inválido
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultado')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Seu IMC é:', style: TextStyle(fontSize: 20)),
              Text(
                imc.toStringAsFixed(2),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                interpretarIMC(),
                style: TextStyle(
                  fontSize: 24,
                  color: corIMC(), // aplica a cor aqui
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Voltar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
