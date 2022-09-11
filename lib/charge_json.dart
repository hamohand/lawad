import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/lettre_model.dart';
import 'package:http/http.dart' as http; // voir pubspec.yaml

class ChargeJson extends StatelessWidget {
  const ChargeJson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return //_chargerRoot();
        throw UnimplementedError();
  }
}
/* ***** Chargement json : deux méthodes ****** */
// méthode 1, à consolider

//Future<List<Photo>> _chargerHttp(http.Client client) async {
Future<List<Lettre>?> _chargerHttp(http.Client client) async {
  final response = await client
      //   .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      .get(Uri.parse('assets/json/lettres.json'));
  //.get(Uri.parse('https://drive.google.com/file/d/1AxJHclljcFX7b03G7B9G-QOuVDaNxlXS/view?usp=sharing'));

  // Use the compute function to run parsePhotos : methode 1
  return convertir(response.body);
  // Use the compute function to run parsePhotos in a separate isolate : : methode 2
  //return compute(parsePhotos, response.body);
}

// méthode 2 OK
//Future<List<Photo>> _chargerRoot() async {

Future _chargerRoot() async {
  String jsonString = //await rootBundle.loadString('json/photos.json');
      //await rootBundle.loadString('https://drive.google.com/file/d/1AxJHclljcFX7b03G7B9G-QOuVDaNxlXS/view?usp=sharing');
      await rootBundle.loadString('assets/json/lettres.json');
  //print('main: jsonString= $jsonString');
  return convertir(jsonString);
}

/* ***** Conversion json ****** */
List<Lettre>? convertir(String responseBody) {
  //final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  final parsed = jsonDecode(responseBody);
  //print('main: parsed= $parsed');
  final parsedTab =
      parsed.map<Lettre>((json) => Lettre.fromJson(json)).toList();
  print('main: parsedTab= ${parsedTab[0].prononciations[0].exemple}');
  return parsedTab;
}
