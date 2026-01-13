class ImcModel {
  double _peso = 0.0;
  double _altura = 0.0;

  ImcModel(this._peso, this._altura);

  double get altura => _altura;

  double get peso => _peso;

  set altura(double value) {
    _altura = value;
  }

  set peso(double value) {
    _peso = value;
  }
}