class CalculadoraImc {

  static double calcularIMC(double altura, double peso) {
    var imc =  peso / (altura*altura);
    return imc;
  }

  static String obterClassificacao(double imc) {
    String classificacao = "";

    switch (imc) {
      case < 16:
        classificacao = "Magreza grave";
        break;
      case < 17:
        classificacao = "Magreza moderada";
        break;
      case < 18.5:
        classificacao = "Magreza leve";
        break;
      case < 25:
        classificacao = "Saudável";
        break;
      case < 30:
        classificacao = "Sobrepeso";
        break;
      case < 35:
        classificacao = "Obesidade Grau 1";
        break;
      case < 40:
        classificacao = "Obesidade Grau 2 (severa)";
        break;
      default:
        classificacao = "Obesidade Grau 3 (mórbida)";
        break;
    }

    return classificacao;
  }
}