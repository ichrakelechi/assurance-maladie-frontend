//import 'dart:html';
import 'package:frontend/pages/aa.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:frontend/pages/other1.dart';
import 'package:frontend/pages/other2.dart';

class Pharmacie extends StatelessWidget {
  final String idbulletin;
  Pharmacie({required this.idbulletin});

  @override
  Widget build(BuildContext context) {
    String _id_Bulletin = idbulletin;
    print(_id_Bulletin);
    addpharmacie(name, nomenclature, amount, id_bulletin) async {
      String url = "http://localhost:2550/arrangement";

      var res = await http.Client().post(Uri.parse(url), body: {
        "id_bulletin": id_bulletin,
        "name": name,
        "nomenclature": nomenclature,
        "amount": amount
      });
      if (res.statusCode == 200) {
        print("Response status: ${res.statusCode}");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Other1(
                    idbulletin: idbulletin,
                  )),
        );
      } else {
        print('hello');
      }
      ;
    }

    final id_bulletin = _id_Bulletin;
    var name;
    var amount;
    var nomenclature;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blueAccent[100],
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text("Pharmacie",
                          style: TextStyle(
                            color: Color.fromARGB(255, 245, 245, 248)
                                .withOpacity(1.0),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent[200],
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 266,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.keyboard_hide,
                                  color: Color.fromARGB(255, 83, 85, 209),
                                ),
                                hintText: "Désignation :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              name = value;
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent[200],
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 266,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.keyboard_hide,
                                  color: Color.fromARGB(255, 83, 85, 209),
                                ),
                                hintText: "Code :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              nomenclature = value;
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent[200],
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 266,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.attach_money,
                                  color: Color.fromARGB(255, 83, 85, 209),
                                ),
                                hintText: "Montant  :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              amount = value;
                            }),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addpharmacie(name, nomenclature, amount,
                              id_bulletin); // Navigator.pushNamed(context, "/accueil");
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 39, 41, 176)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27))),
                        ),
                        child: Text(
                          "Suivant",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Aa(
                                      idbulletin: idbulletin,
                                    )),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 207, 15, 15)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27))),
                        ),
                        child: Text(
                          "Annuler",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_top.png",
                    width: 111,
                  )),
              Positioned(
                  bottom: 0,
                  child: Image.asset(
                    "assets/images/main_bottom.png",
                    width: 111,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
