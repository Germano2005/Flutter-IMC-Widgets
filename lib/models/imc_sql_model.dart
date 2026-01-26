class ImcSqlModel {
  int _id = 0;
  double _peso = 0.0;
  double _altura = 0.0;
  String _classificacao = "";
  double _imcTotal = 0.0;

  ImcSqlModel(this._id, this._peso, this._altura, this._classificacao,
      this._imcTotal);

  double get imcTotal => _imcTotal;

  set imcTotal(double value) {
    _imcTotal = value;
  }

  String get classificacao => _classificacao;

  set classificacao(String value) {
    _classificacao = value;
  }

  double get altura => _altura;

  set altura(double value) {
    _altura = value;
  }

  double get peso => _peso;

  set peso(double value) {
    _peso = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }


}