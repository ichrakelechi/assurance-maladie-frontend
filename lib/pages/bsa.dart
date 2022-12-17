import 'package:flutter/material.dart';
import 'package:frontend/pages/accueila.dart';
import 'package:frontend/pages/addBs.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<BsData>> fetchBsData() async {
  Uri url = Uri.parse('http://192.168.1.119:2550/bulletin');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var resultsJson = json.decode(response.body).cast<Map<String, dynamic>>();
    List<BsData> bslist =
        await resultsJson.map<BsData>((json) => BsData.fromJson(json)).toList();
    return bslist;

    // return DoctorD.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load DoctorD');
  }
}

class BsData {
  final  id_bulletin;
  final  id_u;
  final  claimNumber;
  final  dateBulettin;
  final  companyName;
  final  firstName;
  final  lastName;
  final  adress;
  final  Proffesion;
  final  sick;
  final  sickFirstName;
  final  sickLastName;
  final  cinSick;

  const BsData({
    required this.id_bulletin,
    required this.id_u,
    required this.claimNumber,
    required this.dateBulettin,
    required this.companyName,
    required this.firstName,
    required this.lastName,
    required this.adress,
    required this.Proffesion,
    required this.sick,
    required this.sickFirstName,
    required this.sickLastName,
    required this.cinSick,
  });
  factory BsData.fromJson(Map<String, dynamic> json) {
    return BsData(
      id_bulletin: json['id_bulletin'],
      id_u: json['id_u'],
      claimNumber: json['claimNumber'],
      dateBulettin: json['dateBulettin'],
      companyName: json['companyName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      adress: json['adress'],
      Proffesion: json['Proffesion'],
      sick: json['sick'],
      sickFirstName: json['sickFirstName'],
      sickLastName: json['sickLastName'],
      cinSick: json['cinSick'],
    );
  }
}

class Bsa extends StatelessWidget {
  const Bsa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          //color: Colors.blueAccent[100],
          padding: EdgeInsets.all(8.0),
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 44,
                    ),
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
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25.0)),
                      child: TabBar(
                        indicator: BoxDecoration(
                            color: Color.fromARGB(255, 135, 206, 253),
                            borderRadius: BorderRadius.circular(25.0)),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: const [
                          Tab(
                            text: 'bulletins de soins non traités',
                          ),
                          Tab(
                            text: 'bulletins de soins acceptés',
                          ),
                          Tab(
                            text: 'bulletins de soins refusés',
                          ),
                          Tab(
                            text: 'contre visite',
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                        child: TabBarView(
                      children: [
                        Center(
                          child: Text("Chats Pages"),
                        ),
                        Center(
                          child: Text("Status Pages"),
                        ),
                        Center(
                          child: Text('Calls Page'),
                        ),
                        Center(
                          child: Text('Settings Page'),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
