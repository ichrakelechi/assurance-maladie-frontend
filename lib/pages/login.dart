import 'package:flutter/material.dart';
import 'package:frontend/pages/accueila.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'accueil.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    signup(cin, password, role) async {
      String url = "http://192.168.1.119:2550/account/login";

      var res = await http.Client().post(Uri.parse(url),
          body: {"cin": cin, "password": password, "role": role});
          print(role);
      if ((res.statusCode == 200)&&(role=='internal')) {
        print("Response status: ${res.statusCode}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Accueila()),
        );
      } else if ((res.statusCode == 200)&&(role=='client')){
        print("Response status: ${res.statusCode}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Accueil()),
        );
      }else{
        print('hello');
      }
      ;
    }

    var cin;
    var password;
    var role = "client";
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
                      Container(
                        height: 300,
                        child: Image.asset(
                          "assets/images/ctama.png",
                          width: 2000,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Se connecter",
                          style: TextStyle(
                            color: Color.fromARGB(255, 245, 245, 248)
                                .withOpacity(1.0),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
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
                                  Icons.person,
                                  color: Color.fromARGB(255, 39, 41, 176),
                                ),
                                hintText: "CIN :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              cin = value;
                            }),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 23,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent[200],
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 266,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                suffix: Icon(
                                  Icons.visibility,
                                  color: Colors.blueAccent[200],
                                ),
                                icon: Icon(
                                  Icons.lock,
                                  color: Color.fromARGB(255, 39, 41, 176),
                                  size: 19,
                                ),
                                hintText: "Mot de passe :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              password = value;
                            }),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          signup(cin, password, role);
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
                          "Connexion",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Mot de passe oublié ? "),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/password");
                              },
                              child: Text(
                                " cliquez ici",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      )
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

// signup(String cin, String password, String role) async {
//   /*Map<String, String> requestHeaders = {
//       "content-type": "application/json; charset=utf-8"
//     };*/

//   var response = await http
//       .post(url, body: {"cin": cin, "password": password, "role": role});

//   // var jsonResponse = json.decode(response.body);
//   // //print(jsonResponse["token"]);
//   // //print("user token");

//   // //print(jsonResponse["user"]["FullName"]);

//   // return jsonResponse;
// }


