import 'package:imcflutter/models/imc_model.dart';
import 'package:imcflutter/repositories/imc_niveis_repository.dart';

class CalculoImcService {

  String calculoImc(ImcModel imcModel) {
    double imc = imcModel.peso / (imcModel.altura * imcModel.altura);

    try {
      if (imc < 18.9) {
        return ImcNiveisRepository().getNiveis(0); //Abaixo do Peso
      }
      else if (imc < 24.9) {
        return ImcNiveisRepository().getNiveis(1); // Peso Normal
      }
      else if (imc < 29.9) {
        return ImcNiveisRepository().getNiveis(2); // Sobrepeso
      }
      else if (imc < 34.9) {
        return ImcNiveisRepository().getNiveis(3); //Obesidade I
      }
      else if (imc < 39.9) {
        return ImcNiveisRepository().getNiveis(4); //Obesidade II
      }
      else {
        return ImcNiveisRepository().getNiveis(5); //Obesidade III
      }
    }
    catch (e) {
      return "Erro $e";
    }
  }
}