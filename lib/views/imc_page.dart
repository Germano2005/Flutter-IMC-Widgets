import 'package:flutter/material.dart';
import 'package:imcflutter/models/imc_model.dart';
import 'package:imcflutter/widgets/custom_drawer.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {

  var pesoController = TextEditingController();
  var alturaController = TextEditingController();




@override
  void initState() {
    String pesoText = pesoController.text;
    String alturaText = alturaController.text;

    double valorPeso = double.tryParse(pesoText) ?? 0.0;
    double valorAltura = double.tryParse(alturaText) ?? 0.0;

    var imcModel = ImcModel(valorPeso, valorAltura);

    super.initState();
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
                        onPressed: (){

                        },
                        child: Text("Calcular", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),)),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
