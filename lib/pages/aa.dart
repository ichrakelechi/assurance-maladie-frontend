import 'package:flutter/material.dart';
import 'package:frontend/pages/consultation.dart';
import 'package:frontend/pages/dental.dart';
import 'package:frontend/pages/hospital.dart';
import 'package:frontend/pages/pharmacie.dart';

class Aa extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String idbulletin;
  // ignore: non_constant_identifier_names, use_key_in_widget_constructors
  const Aa({required this.idbulletin});

  @override
  Widget build(BuildContext context) {
    String _idBulletin = idbulletin;
    print(_idBulletin);
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Expanded(
                        child: GridView.count(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            primary: false,
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 20,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/doctor1.jfif",
                                        width: 100,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Consultation(
                                                            idbulletin:
                                                                idbulletin,
                                                          )),
                                                );
                                              },
                                              child: Text(
                                                "Consultation",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Color.fromARGB(
                                                        255, 25, 12, 141),
                                                    fontSize: 24),
                                              )),
                                        ],
                                      )
                                    ]),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 20,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/pharmacie.jpg",
                                        width: 100,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                // print(this.id_bulletin);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Pharmacie(
                                                            idbulletin:
                                                                idbulletin,
                                                          )),
                                                );
                                              },
                                              child: Text(
                                                "Pharmacie",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Color.fromARGB(
                                                        255, 25, 12, 141),
                                                    fontSize: 24),
                                              )),
                                        ],
                                      )
                                    ]),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 20,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/hospital.png",
                                        width: 100,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Hospital(
                                                            idbulletin:
                                                                idbulletin,
                                                          )),
                                                );
                                              },
                                              child: Text(
                                                "Hospitalisation",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Color.fromARGB(
                                                        255, 25, 12, 141),
                                                    fontSize: 24),
                                              )),
                                        ],
                                      )
                                    ]),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 20,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/dentiste.png",
                                        width: 100,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Dental(
                                                            idbulletin:
                                                                idbulletin,
                                                          )),
                                                );
                                              },
                                              child: Text(
                                                "soins dentaires et prothése",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Color.fromARGB(
                                                        255, 25, 12, 141),
                                                    fontSize: 24),
                                              )),
                                        ],
                                      )
                                    ]),
                              ),
                            ],
                            crossAxisCount: 2)),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/bs");

                        // Navigator.pushNamed(context, "/accueil");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 39, 41, 176)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "Envoyer la bulletin de soins",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/bs");
                        // Navigator.pushNamed(context, "/accueil");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 207, 15, 15)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "Annuler la demande",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_top.png",
                    width: 90,
                  )),
              Positioned(
                  bottom: 0,
                  child: Image.asset(
                    "assets/images/main_bottom.png",
                    width: 45,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
