import 'package:flutter/material.dart';
import 'package:frontend/pages/accueil.dart';
import 'package:frontend/pages/accueila.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

Future<List<DoctorD>> fetchDoctorD() async {
  Uri url = Uri.parse('http://192.168.1.177:2550/doctor');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.claimlist
    var resultsJson = json.decode(response.body).cast<Map<String, dynamic>>();
    List<DoctorD> doctorlist = await resultsJson
        .map<DoctorD>((json) => DoctorD.fromJson(json))
        .toList();
    return doctorlist;

    // return DoctorD.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load DoctorD');
  }
}

class DoctorD {
  final id;
  final String name;
  final String adress;
  final String city;
  final String MAPlocation;
  final String mobile;

  const DoctorD({
    required this.id,
    required this.name,
    required this.adress,
    required this.city,
    required this.MAPlocation,
    required this.mobile,
  });
  factory DoctorD.fromJson(Map<String, dynamic> json) {
    return DoctorD(
      id: json['_id'],
      name: json['name'],
      adress: json['adress'],
      city: json['city'],
      MAPlocation: json['MAPlocation'],
      mobile: json['mobile'],
    );
  }
}

class Doctor extends StatefulWidget {
  const Doctor({Key? key}) : super(key: key);
  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
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
            "Liste des médecins",
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
            child: FutureBuilder<List<DoctorD>>(
                future: fetchDoctorD(),
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
                                                      snapshot.data![index].name
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
                                                  const Icon(Icons.location_on,
                                                      color: Colors.white),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text(
                                                      snapshot.data![index].city
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
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Image.asset(
                    "assets/images/doc.png",
                    width: 90,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Dr. ${data.name}",
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
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Appeler et Obtenir un rendez-vous"),
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
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Divider(
                  height: 15,
                  color: Color.fromARGB(255, 135, 206, 253),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Available Time",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.access_time,
                    color: Color.fromARGB(255, 135, 206, 253),
                  ),
                  Text("08:30 AM - 01:00 PM")
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
