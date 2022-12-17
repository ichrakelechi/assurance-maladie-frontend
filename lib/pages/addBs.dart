import 'package:frontend/pages/aa.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AddBs extends StatelessWidget {
  const AddBs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var idbulletin;
    var id_u;
    var claimNumber;
    var dateBulettin;
    var companyName;
    var firstName;
    var lastName;
    var adress;
    var Proffesion;
    var sick;
    var sickFirstName;
    var sickLastName;
    var cinSick;

    add(
        id_bulletin,
        id_u,
        claimNumber,
        dateBulettin,
        companyName,
        firstName,
        lastName,
        adress,
        Proffesion,
        sick,
        sickFirstName,
        sickLastName,
        cinSick) async {
      String url = "http://localhost:2550/bulletin";

      var res = await http.Client().post(Uri.parse(url), body: {
        "id_bulletin": id_bulletin,
        "id_u": id_u,
        "claimNumber": claimNumber,
        "dateBulettin": dateBulettin,
        "companyName": companyName,
        "firstName": firstName,
        "lastName": lastName,
        "adress": adress,
        "Proffesion": Proffesion,
        "sick": sick,
        "sickFirstName": sickFirstName,
        "sickLastName": sickLastName,
        "cinSick": cinSick
      });
      if (res.statusCode == 200) {
        print("Response status: ${res.statusCode}");
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Aa(
                    idbulletin: idbulletin,
                  )),
        );
      } else {
        print('hello');
      }
    }

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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text("Informations",
                          style: TextStyle(
                            color: Color.fromARGB(255, 135, 206, 253)
                                .withOpacity(1.0),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 135, 206, 253),
                          borderRadius: BorderRadius.circular(66),
                        ),
                        width: 266,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.keyboard_hide,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "Id bulletin :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              idbulletin = value;
                            }),
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
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.keyboard_hide,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "Id user :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              id_u = value;
                            }),
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
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.keyboard_hide,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "Numéro sinistre :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              claimNumber = value;
                            }),
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
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.date_range,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "Date:",
                                border: InputBorder.none),
                            onChanged: (value) {
                              dateBulettin = value;
                            }),
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
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.home_repair_service,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "Employeur :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              companyName = value;
                            }),
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
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "Nom de l'adhérent :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              firstName = value;
                            }),
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
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "Prénom de l'adhérent :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              lastName = value;
                            }),
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
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.home,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "Adresse de l'adhérent :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              adress = value;
                            }),
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
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.keyboard_hide,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "Proffesion :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              Proffesion = value;
                            }),
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
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.group,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "lieu de parenté du malade :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              sick = value;
                            }),
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
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "Nom du malade :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              sickFirstName = value;
                            }),
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
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "Prénom du malade :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              sickLastName = value;
                            }),
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
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.keyboard_hide,
                                  color: Colors.blueAccent[400],
                                ),
                                hintText: "Cin du malade :",
                                border: InputBorder.none),
                            onChanged: (value) {
                              cinSick = value;
                            }),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          add(
                              idbulletin,
                              id_u,
                              claimNumber,
                              dateBulettin,
                              companyName,
                              firstName,
                              lastName,
                              adress,
                              Proffesion,
                              sick,
                              sickFirstName,
                              sickLastName,
                              cinSick); // Navigator.pushNamed(context, "/accueil");
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent[200]),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27))),
                        ),
                        child: Text(
                          "Suivant",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context,
                              "/bs"); // Navigator.pushNamed(context, "/accueil");
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 207, 15, 15)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27))),
                        ),
                        child: Text(
                          "Annuler",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
