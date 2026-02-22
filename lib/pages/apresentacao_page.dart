import 'package:flutter/material.dart';

class ApresentacaoPage extends StatelessWidget {
  const ApresentacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView(
        children: [
          Text(
            "O que é IMC ?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "     IMC é uma sigla e significa “Índice de Massa Corporal”. O IMC é uma das formas de avaliação corporal recomendada pela OMS (Organização Mundial de Saúde) para classificação do estado antropométrico, ou seja, da composição corporal do indivíduo.",
            //textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            "Para que serve o cálculo do Índice de Massa Corporal?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "     O IMC é um dos parâmetros utilizados para classificar a composição corporal de uma pessoa. Isso porque ele avalia se o peso está adequado para a estatura. Por isso, não é incomum que ele seja aferido durante exames de check-up, por exemplo.",
            //textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            "     Estudos científicos demonstram que os indivíduos que se afastam da faixa adequada ou recomendada do IMC, seja para mais ou para menos, apresentam maior risco de complicações para a saúde e também de mortalidade.",
            //textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            "     Embora seja uma ferramenta importante e reconhecida mundialmente, o IMC não informa sobre a circunferência abdominal, a distribuição da gordura corporal e a massa muscular.",
            //textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            "     Atualmente, essas medidas também são reconhecidas como informações relevantes e importantes para a análise de composição corporal por demonstrarem relação com o risco de problemas cardiovasculares e para a saúde em geral.",
            //textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            "Fórmula",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 70,
            child: Card(
              color: Colors.blue[200],
              child: Center(
                child: Text(
                  "Peso / Altura²",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Tabela de Faixas de IMC",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Image.asset(
            "lib/images/tabela_IMC.png",
            filterQuality: FilterQuality.high,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
