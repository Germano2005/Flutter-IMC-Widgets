import 'package:flutter/material.dart';

import '../models/imc_model.dart';
import '../repositories/imc_repository.dart';
import '../service/calculo_imc_service.dart';

class ImcHistoric extends StatefulWidget {
  const ImcHistoric({super.key});

  @override
  State<ImcHistoric> createState() => _ImcHistoricState();
}

class _ImcHistoricState extends State<ImcHistoric> {

  var imcRepository = ImcRepository();
  var imcCalcService = CalculoImcService();
  var medidas = <ImcModel>[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterMedidas();
  }

  void obterMedidas() async {
    var lista = await imcRepository.listarMedidas();

    // Garantir que todos os IMCs estejam calculados
    for (var medida in lista) {
      if (medida.imcTotal == 0.0) {
        medida.imcTotal = imcCalcService.calculoImc(medida);
      }
    }

    setState(() {
      medidas = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Lista de medidas"),
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView.builder(
                itemCount: medidas.length,
                itemBuilder: (_, int index){
                  var medida = medidas[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Peso: ${medida.peso}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Altura: ${medida.altura}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("IMC: ${medida.imcTotal.toStringAsFixed(2)}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Classificação: ${medida.classificacao}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        )
    );
  }
}
