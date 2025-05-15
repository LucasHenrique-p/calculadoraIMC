import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  final double imc;

  const TelaResultado({required this.imc});

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

  String emoticonIMC() {
    if (imc < 18.5) {
      return '😕'; // Magreza
    } else if (imc >= 18.5 && imc <= 24.9) {
      return '😄'; // Normal
    } else if (imc >= 25 && imc <= 29.9) {
      return '😐'; // Sobrepeso
    } else if (imc >= 30 && imc < 39.9) {
      return '😟'; // Obesidade
    } else if (imc >= 40) {
      return '😨'; // Obesidade Grave
    }
    return '❓';
  }

  String mensagemIMC() {
    if (imc < 18.5) {
      return 'Você está abaixo do peso ideal. Tente manter uma alimentação equilibrada e consulte um nutricionista.';
    } else if (imc >= 18.5 && imc <= 24.9) {
      return 'Parabéns! Seu peso está dentro da faixa ideal. Continue com seus bons hábitos de saúde!';
    } else if (imc >= 25 && imc <= 29.9) {
      return 'Atenção! Você está com sobrepeso. Procure melhorar a alimentação e incluir exercícios físicos na rotina.';
    } else if (imc >= 30 && imc < 39.9) {
      return 'Cuidado! Você está com obesidade. Busque apoio médico e nutricional para um plano de ação saudável.';
    } else if (imc >= 40) {
      return 'Alerta! Obesidade grave pode trazer riscos sérios à saúde. Procure acompanhamento profissional o quanto antes.';
    }
    return 'Não foi possível gerar uma mensagem para este valor.';
  }

  Color corIMC() {
    if (imc < 18.5) {
      return Colors.blue;
    } else if (imc >= 18.5 && imc <= 24.9) {
      return Colors.green;
    } else if (imc >= 25 && imc <= 29.9) {
      return Colors.orange;
    } else if (imc >= 30 && imc < 39.9) {
      return Colors.red;
    } else if (imc >= 40) {
      return Colors.purple;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final String descricao = interpretarIMC();
    final String emoji = emoticonIMC();
    final String mensagem = mensagemIMC();

    return Scaffold(
      backgroundColor: Colors.white,
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
                '$descricao $emoji',
                style: TextStyle(
                  fontSize: 24,
                  color: corIMC(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                mensagem,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
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
