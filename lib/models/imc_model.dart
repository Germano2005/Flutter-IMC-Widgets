class ImcModel {
  double _peso = 0.0;
  double _altura = 0.0;
  String _classificacao = "";
  double _imcTotal = 0.0;


  ImcModel(this._peso, this._altura);

  double get altura => _altura;

  double get peso => _peso;

  set altura(double value) {
    _altura = value;
  }

  set peso(double value) {
    _peso = value;
  }

  void setClassificacoes(int i){
    var lista = ["Abaixo do pesso", "Peso Normal", "Sobrepeso", "Obesidade I", "Obesidade II", "Obesidade III"];

    _classificacao = lista[i];
  }


  String get classificacao => _classificacao;

  double get imcTotal => _imcTotal;

  set imcTotal(double value) {
    _imcTotal = value;
  }


}