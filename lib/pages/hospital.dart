//import 'dart:html';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:frontend/pages/aa.dart';

class Hospital extends StatelessWidget {
  final String idbulletin;
  // ignore: non_constant_identifier_names
  Hospital({required this.idbulletin});

  @override
  Widget build(BuildContext context) {
    String _id_Bulletin = idbulletin;
    print(_id_Bulletin);
    addHospital(dateE, dateR, amount, observation, id_bulletin) async {
      String url = "http://localhost:2550/hospitalization";
      var res = await http.Client().post(Uri.parse(url), body: {
        "dateE": dateE,
        "dateR": dateR,
        "amount": amount,
        "observation": observation,
        "id_bulletin": id_bulletin,
      });
      if (res.statusCode == 200) {
        print("Response status: ${res.statusCode}");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Aa(
                    idbulletin: '$id_bulletin',
                  )),
        );
      } else {
        print('hello');
      }
      ;
    }

    var dateE;
    var dateR;
    var amount;
    var observation;
    final id_bulletin = _id_Bulletin;
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
                      Text("Hospitalisation",
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
                                  Icons.date_range,
                                  color: Color.fromARGB(255, 83, 85, 209),
                                ),
                                hintText: "Date d'entrée :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              dateE = value;
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
                                  Icons.date_range,
                                  color: Color.fromARGB(255, 83, 85, 209),
                                ),
                                hintText: "Date de sortie :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              dateR = value;
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
                                hintText: "Montant :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              amount = value;
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
                                hintText: "Observations :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              observation = value;
                            }),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addHospital(
                              dateE, dateR, amount, observation, id_bulletin);
                          // Navigator.pushNamed(context, "/accueil");
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
