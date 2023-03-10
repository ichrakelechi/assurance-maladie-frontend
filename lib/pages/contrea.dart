import 'package:flutter/material.dart';
import 'package:frontend/pages/accueil.dart';
import 'package:frontend/pages/accueila.dart';
import 'package:frontend/pages/addcontre.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<ContreaData>> fetchContreaData() async {
  Uri url = Uri.parse('http://192.168.1.177:2550/Reclamations');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.claimlist
    var resultsJson = json.decode(response.body).cast<Map<String, dynamic>>();
    List<ContreaData> Contrealist = await resultsJson
        .map<ContreaData>((json) => ContreaData.fromJson(json))
        .toList();
    return Contrealist;

    // return ClaimaData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ContreData');
  }
}

class ContreaData {
  final String titre;
  final int cin;
  final String description;

  const ContreaData({
    required this.titre,
    required this.cin,
    required this.description,
  });
  factory ContreaData.fromJson(Map<String, dynamic> json) {
    return ContreaData(
      titre: json['titre'],
      cin: json['cin'],
      description: json['description'],
    );
  }
}

class Contrea extends StatefulWidget {
  const Contrea({Key? key}) : super(key: key);
  @override
  State<Contrea> createState() => _ContreaState();
}

class _ContreaState extends State<Contrea> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Accueil()));
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
            "Liste des contre visites",
            style: TextStyle(
              color: const Color.fromARGB(255, 135, 206, 253).withOpacity(1.0),
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
            child: FutureBuilder<List<ContreaData>>(
                future: fetchContreaData(),
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
                                                  const Icon(Icons.create,
                                                      color: Colors.white),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text(
                                                      snapshot
                                                          .data![index].titre
                                                          .toString(),
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
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Image.asset(
                    "assets/images/claima.webp",
                    width: 90,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(" ${data.cin}",
                    style: const TextStyle(fontSize: 25, color: Colors.black)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.create,
                    color: Color.fromARGB(255, 135, 206, 253),
                  ),
                  Container(
                    child: Text("Titre: ${data.titre}",
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.border_color,
                    color: Color.fromARGB(255, 135, 206, 253),
                  ),
                  Container(
                    child: Text("D??scription: ${data.description}",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Divider(
                  height: 15,
                  color: Color.fromARGB(255, 135, 206, 253),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
