import 'package:flutter/material.dart';

class ImcHistoric extends StatefulWidget {
  const ImcHistoric({super.key});

  @override
  State<ImcHistoric> createState() => _ImcHistoricState();
}

class _ImcHistoricState extends State<ImcHistoric> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Histórico de IMCs"),
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        )
    );
  }
}
