import 'package:flutter/material.dart';
import 'package:imcflutter/views/imc_historic.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.blueAccent
                ),
                currentAccountPicture: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Image.network("https://cdn-icons-png.flaticon.com/512/1144/1144760.png")),
                accountName: Text("User"),
                accountEmail: Text("email@email.com")
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.history),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Histórico de Medidas"),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImcHistoric()));
            },
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
