import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Calculo de IMC"),
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
          ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.numbers),
                      Text("Digite seu peso"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.keyboard_double_arrow_up),
                      Text("Digite sua Altura"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 35,
                    alignment: Alignment.center,
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
                        child: Text("Calcular", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
