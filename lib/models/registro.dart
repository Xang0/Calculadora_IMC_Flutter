class Registro {
  int _id = 0;
  double _peso = 0;
  double _altura = 0;
  double _imc = 0;
  String _faixa = "";
  DateTime _data = DateTime.now();

  Registro(int id, double peso, double altura, double imc, String faixa) {
    _id = id;
    _peso = peso;
    _altura = altura;
    _imc = imc;
    _faixa = faixa;
  }

  Registro.comData(int id, double peso, double altura, double imc, String faixa, DateTime data) {
    _id = id;
    _peso = peso;
    _altura = altura;
    _imc = imc;
    _faixa = faixa;
    _data = data;
  }

  // Gets
  int get id => _id;
  double get peso => _peso;
  double get altura => _altura;
  double get imc => _imc;
  String get faixa => _faixa;
  DateTime get data => _data;

  //Sets
  void setPeso(double valor) {
    _peso = valor;
  }

  void setAltura(double valor) {
    _altura = valor;
  }

  void setImc(double valor) {
    _imc = valor;
  }

  void setFaixa(String valor) {
    _faixa = valor;
  }
}