import 'package:flutter/material.dart';

import 'package:frontend/pages/accueil.dart';
import 'package:frontend/pages/accueila.dart';
import 'package:frontend/pages/addBs.dart';
import 'package:frontend/pages/addClaim.dart';
import 'package:frontend/pages/addDoctor.dart';
import 'package:frontend/pages/addcontre.dart';
import 'package:frontend/pages/adherant.dart';
import 'package:frontend/pages/bs.dart';
import 'package:frontend/pages/bsa.dart';
import 'package:frontend/pages/claim.dart';
import 'package:frontend/pages/claima.dart';
import 'package:frontend/pages/contre.dart';
import 'package:frontend/pages/contrea.dart';
import 'package:frontend/pages/doctora.dart';
import 'package:frontend/pages/login.dart';
import 'package:frontend/pages/modifierDoctor.dart';
import 'package:frontend/pages/password.dart';
import 'package:frontend/pages/suivie.dart';
import 'package:frontend/pages/welcome.dart';
import 'package:frontend/pages/setting.dart';
import 'package:frontend/pages/doctor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/accueil",
      routes: {
        "/": (context) => const Welcome(),
        "/login": (context) => const Login(),
        "/password": (context) => const Password(),
        "/bs": (context) => const Bs(),
        "/bsa": (context) => const Bsa(),
        "/accueil": (context) => const Accueil(),
        "/accueila": (context) => const Accueila(),
        "/setting": (context) => const Setting(),
        "/doctor": (context) => const Doctor(),
        "/modifierdoctor": (context) => ModifierDoctor(
            doctorData:
                ModalRoute.of(context)!.settings.arguments as DoctorData),
        "/doctora": (context) => const Doctora(),
        "/adddoctor": (context) => const AddDoctor(),
        "/claim": (context) => const Claim(),
        "/claima": (context) => const Claima(),
        "/addBs": (context) => const AddBs(),
        "/addClaim": (context) => const AddClaim(),
        "/addcontre": (context) => Addcontre(),

        //"/dental": (context) => const Dental(),
        // "/hospital": (context) => const Hospital(),
        // "/aa": (context) => const Aa(
        //       id_bulletin: globals.id_bulletin,
        //     ),
        // "/consultation": (context) => const Consultation(),
        // "/pharmacie": (context) => const Pharmacie(),
        // "/other": (context) => const Other(),
        //"/other1": (context) => const Other1(),
        // "/other2": (context) => const Other2(),
        "/contre": (context) => const Contre(),
        "/contrea": (context) => const Contrea(),
        "/suivie": (context) => const Suivie(),
        "/adherant": (context) => const Adherant(),
      },
    );
  }
}
