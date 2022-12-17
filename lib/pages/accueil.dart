import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          //  color: Colors.blueAccent[100],
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text("Deconnexion"),
                            IconButton(
                                icon: const Icon(Icons.logout),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/login");
                                }),
                          ],
                        )

                        // child: OutlinedButton(
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, "/login");
                        //   },
                        //   style: ButtonStyle(
                        //     padding: MaterialStateProperty.all(
                        //         const EdgeInsets.symmetric(
                        //             horizontal: 20, vertical: 10)),
                        //     shape: MaterialStateProperty.all(
                        //         RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(27))),
                        //   ),
                        //   child: const Text(
                        //     "Déconnexion",
                        //     style: TextStyle(fontSize: 24),
                        //   ),
                        // ),
                        ),
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                        child: Center(
                      child: GridView.count(
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 8.0,
                          primary: false,
                          crossAxisCount: 2,
                          children: <Widget>[
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                color: const Color.fromARGB(255, 135, 206, 253),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/note.png",
                                        width: 80,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, "/bs");
                                              },
                                              child: const Text(
                                                "Bulletins de soin",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              )),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 2,
                                color: const Color.fromARGB(255, 135, 206, 253),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/contre.png",
                                        width: 90,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, "/contre");
                                              },
                                              child: const Text(
                                                "Contre visite",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              )),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 2,
                                color: const Color.fromARGB(255, 135, 206, 253),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/doctor.png",
                                        width: 90,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, "/doctor");
                                              },
                                              child: const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Text(
                                                  "Médecins",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              )),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                color: const Color.fromARGB(255, 135, 206, 253),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 2,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/adherant.png",
                                        width: 80,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, "/accueila");
                                              },
                                              child: const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Text(
                                                  "Suivie du plafond",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              )),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 2,
                                color: const Color.fromARGB(255, 135, 206, 253),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/settings.png",
                                        width: 70,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, "/setting");
                                              },
                                              child: const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Text(
                                                  " Réglage",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              )),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                color: const Color.fromARGB(255, 135, 206, 253),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/claim.png",
                                        width: 80,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, "/claim");
                                              },
                                              child: const Text(
                                                "Réclamations",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              )),
                                        ],
                                      )
                                    ]),
                              ),
                            )
                          ]),
                    ))
                  ],
                ),
              ),
              //   Positioned(
              //       left: 0,
              //       child: Image.asset(
              //         "assets/images/main_top.png",
              //         width: 90,
              //       )),
              //   Positioned(
              //       bottom: 0,
              //       child: Image.asset(
              //         "assets/images/main_bottom.png",
              //         width: 45,
              //       )),
            ],
          ),
        ),
      ),
    );
  }
}
