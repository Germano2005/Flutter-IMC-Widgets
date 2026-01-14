import 'package:flutter/material.dart';
import 'package:imcflutter/models/imc_model.dart';
import 'package:imcflutter/repositories/imc_repository.dart';
import 'package:imcflutter/service/calculo_imc_service.dart';
import 'package:imcflutter/widgets/custom_drawer.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {

  var imcRepository = ImcRepository();
  var imcCalcService = CalculoImcService();
  var medidas = <ImcModel>[];

  var pesoController = TextEditingController();
  var alturaController = TextEditingController();

  double alteraPeso(){
    String pesoText = pesoController.text;

    double valorPeso = double.tryParse(pesoText) ?? 0.0;

    return valorPeso;

  }

  double alteraAltura(){
    String alturaText = alturaController.text;

    double valorAltura = double.tryParse(alturaText) ?? 0.0;

    return valorAltura;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Calculo de IMC"),
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
          ),
          drawer: CustomDrawer(),
          body: SizedBox(
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Calcule seu IMC", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: pesoController,
                    decoration: InputDecoration(
                      labelText: "Digite seu peso em kg",
                      hintText: "Ex: 73",
                      prefixIcon: Icon(Icons.numbers, color: Colors.blueAccent,)
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: alturaController,
                    decoration: InputDecoration(
                        labelText: "Digite sua altura em cm",
                        hintText: "Ex: 180",
                        prefixIcon: Icon(Icons.arrow_upward, color: Colors.blueAccent,)
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10)
                        ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueAccent
                      ),
                        onPressed: () async{
                          double alturaEmMetro = alteraAltura() /100;

                          var imcModel = ImcModel(alteraPeso(), alturaEmMetro);

                          imcModel.imcTotal = imcCalcService.calculoImc(imcModel);


                            await imcRepository.adicionarMedida(imcModel);

                            pesoController.clear();
                            alturaController.clear();

                            showDialog(context: context, builder: (BuildContext bc){
                              return AlertDialog(
                                title: Text("Medida cadastrada com sucesso!"),
                                content: Text("Seu IMC é: ${imcModel.imcTotal.toStringAsFixed(2)}\n"
                                    "Classificação: ${imcModel.classificacao}"),
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      }, 
                                      child: Text("OK"))
                                ],
                              );
                            });
                        },
                        child: Text("Calcular", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),)),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}
