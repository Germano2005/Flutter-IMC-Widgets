import 'package:imcflutter/models/imc_model.dart';

class ImcRepository {

  static final ImcRepository _instance = ImcRepository._internal();

  factory ImcRepository() {
    return _instance;
  }

  ImcRepository._internal();

  final List<ImcModel> _medidas = [];

  Future<void> adicionarMedida(ImcModel imcModel) async{
    await Future.delayed(Duration(milliseconds: 0));
    _medidas.add(imcModel);
  }

  Future<List<ImcModel>> listarMedidas() async{
    await Future.delayed(Duration(milliseconds: 0));
    return _medidas;
  }



}