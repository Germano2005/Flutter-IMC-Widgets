import 'package:imcflutter/models/imc_model.dart';

class CalculoImcService {

  double calculoImc(ImcModel imcModel) {
    double imc = imcModel.peso / (imcModel.altura * imcModel.altura);

    if (imc < 18.9) {
      imcModel.setClassificacoes(0); //Abaixo do Peso
    }
    else if (imc < 24.9) {
      imcModel.setClassificacoes(1); // Peso Normal
    }
    else if (imc < 29.9) {
      imcModel.setClassificacoes(2);// Sobrepeso
    }
    else if (imc < 34.9) {
      imcModel.setClassificacoes(3);//Obesidade I
    }
    else if (imc < 39.9) {
      imcModel.setClassificacoes(4);//Obesidade II
    }
    else {
      imcModel.setClassificacoes(5);//Obesidade III
    }

    return imc;


  }
}