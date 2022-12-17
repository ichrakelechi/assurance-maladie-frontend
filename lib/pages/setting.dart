import 'package:flutter/material.dart';
import 'package:frontend/pages/accueil.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          // color: Colors.blueAccent[100],
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Accueil()));
                            },
                            icon: Icon(Icons.arrow_back,
                                color: const Color.fromARGB(255, 135, 206, 253)
                                    .withOpacity(1.0))),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Image.asset(
                      "assets/images/paass.png",
                      width: 150,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        "voulez-vous changer votre mot de passe?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 135, 206, 253)
                              .withOpacity(1.0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 135, 206, 253),
                        borderRadius: BorderRadius.circular(66),
                      ),
                      width: 266,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            suffix: Icon(
                              Icons.visibility,
                              color: Colors.blueAccent[400],
                            ),
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blueAccent[400],
                              size: 19,
                            ),
                            hintText: "Mot de passe actuel :",
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 135, 206, 253),
                        borderRadius: BorderRadius.circular(66),
                      ),
                      width: 266,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            suffix: Icon(
                              Icons.visibility,
                              color: Colors.blueAccent[400],
                            ),
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blueAccent[400],
                              size: 19,
                            ),
                            hintText: "Nouveau mot de passe :",
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 135, 206, 253),
                        borderRadius: BorderRadius.circular(66),
                      ),
                      width: 266,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            suffix: Icon(
                              Icons.visibility,
                              color: Colors.blueAccent[400],
                            ),
                            icon: Icon(
                              Icons.lock,
                              color: Colors.blueAccent[400],
                              size: 19,
                            ),
                            hintText: "Nouveau mot de passe :",
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/accueil");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent[200]),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "Enregistrer",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                )),
              ),
              // Positioned(
              //     left: 0,
              //     child: Image.asset(
              //       "assets/images/main_top.png",
              //       width: 111,
              //     )),
              // Positioned(
              //     bottom: 0,
              //     child: Image.asset(
              //       "assets/images/main_bottom.png",
              //       width: 111,
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
