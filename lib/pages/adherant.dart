import 'package:flutter/material.dart';
import 'package:frontend/pages/accueila.dart';
import 'package:frontend/pages/addClaim.dart';
import 'package:frontend/pages/addDoctor.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

Future<List<UserData>> fetchUserData() async {
  Uri url = Uri.parse('http://192.168.1.177:2550/user');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var resultsJson = json.decode(response.body).cast<Map<String, dynamic>>();
    List<UserData> doclist = await resultsJson
        .map<UserData>((json) => UserData.fromJson(json))
        .toList();

    return doclist;

    // return UserData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load UserData');
  }
}

class UserData {
  final int cin;
  final String firstName;
  final String lastName;
  final dateDeNaissance;
  final String gender;
  final String adress;
  final String password;
  final String email;
  final String profession;
  final String campanyName;
  final dateDentreTravail;
  final int Salary;
  final String conjoint;
  final String familySituation;
  final weddingDate;
  final String conjointPlan;
  final String professionConjoint;
  final int id_conjoint;
  final int affiliateNumber;
  final bool active;
  final String role;
  final String beneficiaire;
  final String lieuDeParente;
  final int mobile;

  const UserData({
    required this.cin,
    required this.firstName,
    required this.lastName,
    required this.dateDeNaissance,
    required this.gender,
    required this.adress,
    required this.password,
    required this.email,
    required this.profession,
    required this.campanyName,
    required this.dateDentreTravail,
    required this.Salary,
    required this.conjoint,
    required this.familySituation,
    required this.weddingDate,
    required this.conjointPlan,
    required this.mobile,
    required this.professionConjoint,
    required this.id_conjoint,
    required this.affiliateNumber,
    required this.active,
    required this.role,
    required this.beneficiaire,
    required this.lieuDeParente,
  });
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      cin: json['cin'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateDeNaissance: json['dateDeNaissance'],
      gender: json['gender'],
      mobile: json['mobile'],
      adress: json['adress'],
      password: json['password'],
      email: json['email'],
      profession: json['profession'],
      campanyName: json['campanyName'],
      dateDentreTravail: json['dateDentreTravail'],
      Salary: json['Salary'],
      conjoint: json['conjoint'],
      familySituation: json['familySituation'],
      weddingDate: json['weddingDate'],
      conjointPlan: json['conjointPlan'],
      professionConjoint: json['professionConjoint'],
      id_conjoint: json['id_conjoint'],
      affiliateNumber: json['affiliateNumber'],
      active: json['active'],
      role: json['role'],
      beneficiaire: json['beneficiaire'],
      lieuDeParente: json['lieuDeParente'],
    );
  }
}

class Adherant extends StatefulWidget {
  const Adherant({Key? key}) : super(key: key);

  @override
  State<Adherant> createState() => _AdherantState();
}

class _AdherantState extends State<Adherant> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Accueila()));
                },
                icon: Icon(Icons.arrow_back,
                    color: const Color.fromARGB(255, 135, 206, 253)
                        .withOpacity(1.0))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              child: Text(
            "Liste des Adhérants",
            style: TextStyle(
              color: const Color.fromARGB(255, 135, 206, 253).withOpacity(1.0),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddClaim()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 135, 206, 253),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: const Icon(Icons.loop),
              ),
            ),
          ],
        ),
        Expanded(
            child: FutureBuilder<List<UserData>>(
                future: fetchUserData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () => buildShowModalBottomSheet(
                                    context, snapshot.data![index]),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50, right: 50),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      elevation: 2,
                                      color: const Color.fromARGB(
                                          255, 135, 206, 253),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 30),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(Icons.person,
                                                      color: Colors.white),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text(
                                                      snapshot.data![index].cin
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 2),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(Icons.person,
                                                      color: Colors.white),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text(
                                                      "Mr/Mme. ${snapshot.data![index].firstName}  ${snapshot.data![index].lastName}",
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }));
                  }
                })),
      ]),
    ));
  }

  Future buildShowModalBottomSheet(BuildContext context, dynamic data) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Flexible(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.50,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Détails",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Image.asset(
                    "assets/images/person.png",
                    width: 90,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 10,
                  child: Image.asset(
                    "assets/images/adherant.png",
                    width: 90,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Mr/Mme. ${data.firstName}  ${data.lastName}",
                    style: const TextStyle(fontSize: 25, color: Colors.black)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color.fromARGB(255, 135, 206, 253),
                  ),
                  Container(
                    child: Text("Adresse: ${data.adress}",
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black45)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.create,
                    color: Color.fromARGB(255, 135, 206, 253),
                  ),
                  Container(
                    child: Text("Cin: ${data.cin}",
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black45)),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Appeler"),
                const SizedBox(
                  width: 8,
                ),
                IconButton(
                    icon: const Icon(
                      Icons.phone,
                      size: 30,
                      color: Color.fromARGB(255, 135, 206, 253),
                    ),
                    onPressed: () async {
                      UrlLauncher.launch('tel:+216${data.mobile.toString()}');
                    })
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/accueil");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 135, 206, 253)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 9)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "plus de détails",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/accueil");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 135, 206, 253)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 9)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "Modifier",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
