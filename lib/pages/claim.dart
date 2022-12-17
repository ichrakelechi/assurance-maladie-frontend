import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:flutter_svg/svg.dart';
import 'package:frontend/pages/addClaim.dart';
import 'package:frontend/pages/accueil.dart';
import 'package:frontend/pages/claima.dart';

import 'setting.dart';

Future<List<ClaimData>> fetchClaimData() async {
  Uri url = Uri.parse('http://192.168.1.177:2550/Reclamations');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.claimlist
    var resultsJson = json.decode(response.body).cast<Map<String, dynamic>>();
    List<ClaimData> claimlist = await resultsJson
        .map<ClaimData>((json) => ClaimData.fromJson(json))
        .toList();
    return claimlist;

    // return ClaimData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ClaimData');
  }
}

class ClaimData {
  final String titre;
  final int cin;
  final String description;

  const ClaimData({
    required this.titre,
    required this.cin,
    required this.description,
  });
  factory ClaimData.fromJson(Map<String, dynamic> json) {
    return ClaimData(
      titre: json['titre'],
      cin: json['cin'],
      description: json['description'],
    );
  }
}

class Claim extends StatefulWidget {
  const Claim({Key? key}) : super(key: key);
  @override
  State<Claim> createState() => _ClaimState();
}

class _ClaimState extends State<Claim> {
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
            "Liste des réclamations",
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
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
        Expanded(
            child: FutureBuilder<List<ClaimData>>(
                future: fetchClaimData(),
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
                    child: Text("Déscription: ${data.description}",
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
