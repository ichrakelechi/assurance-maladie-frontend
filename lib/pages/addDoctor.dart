// import 'package:frontend/pages/aa.dart';
// import 'package:frontend/pages/doctora.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// class AddDoctor extends StatelessWidget {
//   const AddDoctor({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     AddDoc(name, adress, city, MAPlocation, mobile) async {
//       String url = "http://localhost:2550/doctor";

//       var res = await http.Client().post(Uri.parse(url), body: {
//         "name": name,
//         "adress": adress,
//         "city": city,
//         "MAPlocation": MAPlocation,
//         "mobile": mobile
//       });
//       if (res.statusCode == 200) {
//         print("Response status: ${res.statusCode}");
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const Doctora()),
//         );
//       } else {
//         print('hello');
//       }
//       ;
//     }

//     var name;
//     var city;
//     var MAPlocation;
//     var dateBulettin;
//     var mobile;
//     var adress;

//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           color: Colors.blueAccent[100],
//           child: Stack(
//             children: [
//               SizedBox(
//                 height: double.infinity,
//                 width: double.infinity,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 50,
//                       ),
//                       Text("Informations",
//                           style: TextStyle(
//                             color: Color.fromARGB(255, 245, 245, 248)
//                                 .withOpacity(1.0),
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                           )),
//                       SizedBox(
//                         height: 50,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.blueAccent[200],
//                           borderRadius: BorderRadius.circular(66),
//                         ),
//                         width: 266,
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: TextField(
//                             decoration: InputDecoration(
//                                 icon: Icon(
//                                   Icons.keyboard_hide,
//                                   color: Color.fromARGB(255, 83, 85, 209),
//                                 ),
//                                 hintText: "Nom du médecin :",
//                                 border: InputBorder.none),
//                             onChanged: (value) {
//                               name = value;
//                             }),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.blueAccent[200],
//                           borderRadius: BorderRadius.circular(66),
//                         ),
//                         width: 266,
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: TextField(
//                             decoration: InputDecoration(
//                                 icon: Icon(
//                                   Icons.keyboard_hide,
//                                   color: Color.fromARGB(255, 83, 85, 209),
//                                 ),
//                                 hintText: "Adress :",
//                                 border: InputBorder.none),
//                             onChanged: (value) {
//                               adress = value;
//                             }),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.blueAccent[200],
//                           borderRadius: BorderRadius.circular(66),
//                         ),
//                         width: 266,
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: TextField(
//                             decoration: InputDecoration(
//                                 icon: Icon(
//                                   Icons.keyboard_hide,
//                                   color: Color.fromARGB(255, 83, 85, 209),
//                                 ),
//                                 hintText: "Ville :",
//                                 border: InputBorder.none),
//                             onChanged: (value) {
//                               city = value;
//                             }),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.blueAccent[200],
//                           borderRadius: BorderRadius.circular(66),
//                         ),
//                         width: 266,
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: TextField(
//                             decoration: InputDecoration(
//                                 icon: Icon(
//                                   Icons.date_range,
//                                   color: Color.fromARGB(255, 83, 85, 209),
//                                 ),
//                                 hintText: "Localisation:",
//                                 border: InputBorder.none),
//                             onChanged: (value) {
//                               MAPlocation = value;
//                             }),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.blueAccent[200],
//                           borderRadius: BorderRadius.circular(66),
//                         ),
//                         width: 266,
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: TextField(
//                             decoration: InputDecoration(
//                                 icon: Icon(
//                                   Icons.home_repair_service,
//                                   color: Color.fromARGB(255, 83, 85, 209),
//                                 ),
//                                 hintText: "Numéro :",
//                                 border: InputBorder.none),
//                             onChanged: (value) {
//                               mobile = value;
//                             }),
//                       ),
//                       SizedBox(
//                         height: 50,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           AddDoc(name, adress, city, MAPlocation,
//                               mobile); // Navigator.pushNamed(context, "/accueil");
//                         },
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(
//                               Color.fromARGB(255, 39, 41, 176)),
//                           padding: MaterialStateProperty.all(
//                               EdgeInsets.symmetric(
//                                   horizontal: 50, vertical: 10)),
//                           shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(27))),
//                         ),
//                         child: Text(
//                           "Suivant",
//                           style: TextStyle(fontSize: 24),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context,
//                               "/bs"); // Navigator.pushNamed(context, "/accueil");
//                         },
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(
//                               Color.fromARGB(255, 207, 15, 15)),
//                           padding: MaterialStateProperty.all(
//                               EdgeInsets.symmetric(
//                                   horizontal: 50, vertical: 10)),
//                           shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(27))),
//                         ),
//                         child: Text(
//                           "Annuler",
//                           style: TextStyle(fontSize: 24),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 50,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                   left: 0,
//                   child: Image.asset(
//                     "assets/images/main_top.png",
//                     width: 111,
//                   )),
//               Positioned(
//                   bottom: 0,
//                   child: Image.asset(
//                     "assets/images/main_bottom.png",
//                     width: 111,
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:frontend/pages/doctora.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:flutter_svg/svg.dart';
import 'package:frontend/pages/addBs.dart';
import 'package:frontend/pages/accueil.dart';
import 'package:frontend/pages/claima.dart';

import 'setting.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/other2.dart';

class AddDoctor extends StatelessWidget {
  const AddDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    addDoc(name, adress, city, MAPlocation, mobile) async {
      Uri url = Uri.parse('http://192.168.1.177:2550/doctor');
      var res = await http.Client().post((url), body: {
        "name": name,
        "adress": adress,
        "city": city,
        "MAPlocation": MAPlocation,
        "mobile": mobile
      });
      if (res.statusCode == 200) {
        print("Response status: ${res.statusCode}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Doctora()),
        );
      } else {
        print('hello');
      }
      ;
    }

    var name;
    var city;
    var MAPlocation;
    var dateBulettin;
    var mobile;
    var adress;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
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
                      Text("Ajouter un nouveau médecin",
                          style: TextStyle(
                            color: Color.fromARGB(255, 135, 206, 253)
                                .withOpacity(1.0),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        child: Image.asset(
                          "assets/images/doctor1.jfif",
                          width: 2000,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 135, 206, 253)
                              .withOpacity(1.0),
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
                                hintText: "Nom du médecin :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              name = value;
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 135, 206, 253)
                              .withOpacity(1.0),
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
                                hintText: "Adresse :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              adress = value;
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 135, 206, 253)
                              .withOpacity(1.0),
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
                                hintText: "Ville :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              city = value;
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 135, 206, 253)
                              .withOpacity(1.0),
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
                                hintText: "Localisation :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              MAPlocation = value;
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 135, 206, 253)
                              .withOpacity(1.0),
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
                                hintText: "Numéro :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              mobile = value;
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addDoc(name, adress, city, MAPlocation,
                              mobile); // Navigator.pushNamed(context, "/accueil");
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 83, 85, 209)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27))),
                        ),
                        child: Text(
                          "Ajouter",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context,
                              "/doctora"); // Navigator.pushNamed(context, "/accueil");
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
