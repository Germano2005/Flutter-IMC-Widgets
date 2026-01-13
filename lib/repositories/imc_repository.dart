import 'package:imcflutter/models/imc_model.dart';

class ImcRepository {

  final List<ImcModel> _medidas = [];

  Future<void> adicionarMedida(ImcModel imcModel) async{
    await Future.delayed(Duration(milliseconds: 0));
    _medidas.add(imcModel);
  }



}