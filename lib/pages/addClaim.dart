import 'package:flutter/material.dart';
import 'package:frontend/pages/addBs.dart';

import 'claim.dart';




class AddClaim extends StatelessWidget {
  const AddClaim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          //color: Colors.blueAccent[100],
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
                      Center(
                        child: Text(
                          "Nouvelle réclamation",
                          style: TextStyle(
                            color: Color.fromARGB(255, 135, 206, 253).withOpacity(1.0),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                       SizedBox(
                        height: 10,
                      ),
                      Container(
                      height: 150,
                      child: Image.asset(
                        "assets/images/claima.webp",
                        width: 150,
                      ),
                    ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 135, 206, 253),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        width: 266,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.create,
                                  color: Colors.white,
                                ),
                                hintText: ("Titre de la réclamation :"),
                                border: InputBorder.none),style: TextStyle( color: Colors.white ),
                            onChanged: (value) {}),
                      ),
                        SizedBox(height: 20,),
                            Container(
                              width:350,
                              height: 200,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 135, 206, 253),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.create,
                                  color: Colors.white,
                                ),
                                hintText: "Entez votre réclamation :",
                                border: InputBorder.none), maxLines: 10,minLines: 1,style: TextStyle( color: Colors.white ),
                            onChanged: (value) {}),
                      ),
                        
                    
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, "/accueil");
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 135, 206, 253).withOpacity(1.0)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27))),
                        ),
                        child: Text(
                          "Envoyer",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //   left: 50,
              //   child: InkWell(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => const Claim()),
              //       );
              //     },
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(20.0),
              //       child: Image.asset('assets/images/aaa.jpg', width: 70),
              //     ),
              //   ),
              // ),
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
