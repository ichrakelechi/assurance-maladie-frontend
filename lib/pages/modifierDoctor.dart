import 'package:flutter/material.dart';
import 'package:frontend/pages/addBs.dart';
import 'package:frontend/pages/doctor.dart';
import 'package:http/http.dart' as http;
import 'doctora.dart';

//Future <bool> saveDoctor( DoctorData model,
//bool isEditMode) async{

//}

class ModifierDoctor extends StatelessWidget {
  final DoctorData doctorData;
  const ModifierDoctor({Key? key, required this.doctorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<dynamic> updateDoctorInformation(
        name, adress, city, MAPlocation, mobile) async {
      var url = Uri.parse("http://192.168.1.119:2550/doctor/:$doctorData._id");
      var idD = doctorData.id;
      var response = await http.put(url, body: {
        "name": name,
        "adress": adress,
        "city": city,
        "MAPlocation": MAPlocation,
        "mobile": mobile
      });

      print(response.body);
      if (response.statusCode == 200) {
        print("Response status: ${response.statusCode}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Doctora()),
        );
      } else {
        print('hello');
      }
      ;
      return response.statusCode;
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Doctora()));
                            },
                            icon: Icon(Icons.arrow_back,
                                color: const Color.fromARGB(255, 135, 206, 253)
                                    .withOpacity(1.0))),
                      ],
                    ),
                    Container(
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                            initialValue: doctorData.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: 'Nom',
                              filled: true,
                              fillColor: Color.fromARGB(255, 135, 206, 253),
                            ),
                            onChanged: (value) {
                              name = value + '';
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                            initialValue: doctorData.adress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: 'Adresse',
                              filled: true,
                              fillColor: Color.fromARGB(255, 135, 206, 253),
                            ),
                            onChanged: (value) {
                              adress = value;
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                            initialValue: doctorData.city,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: 'Ville',
                              filled: true,
                              fillColor: Color.fromARGB(255, 135, 206, 253),
                            ),
                            onChanged: (value) {
                              city = value;
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                            initialValue: doctorData.MAPlocation,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: 'Localisation',
                              filled: true,
                              fillColor: Color.fromARGB(255, 135, 206, 253),
                            ),
                            onChanged: (value) {
                              MAPlocation = value;
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                            initialValue: doctorData.mobile.toString(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: 'Numéro',
                              filled: true,
                              fillColor: Color.fromARGB(255, 135, 206, 253),
                            ),
                            onChanged: (value) {
                              mobile = value;
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(doctorData.name);
                        updateDoctorInformation(
                            name.toString(),
                            adress.toString(),
                            city.toString(),
                            MAPlocation.toString(),
                            mobile.toString());
                        // Navigator.pushNamed(context, "/accueil");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 135, 206, 253)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "Enregistrer",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, "/accueil");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 216, 46, 46)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "Supprimer",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
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
