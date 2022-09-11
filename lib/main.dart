import 'dart:convert';
import 'dart:io';

import 'package:lawad/themes.dart';
import 'package:lawad/titre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:http/http.dart' as http; // voir pubspec.yaml

import 'models/lettre_model.dart';
import 'onglets/apropos.dart';
import 'onglets/clavier.dart';
import 'onglets/liens/liens.dart';
import 'onglets/liste/0_lettres_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Alphabet';
    // Thèmes
    // exemples variations prédéfinies, méthode 1
    const Color bleu = Colors.lightBlue;
    const Color vert = Colors.green;
    const Color ambre = Colors.amber;
    final double zoom = 1.0;
    //exemples couleurs, méthode 2
    const int numCouleurBase_1 = 0xFF40C4FF; // LightBlueAccent
    const int numCouleurBase_2 = 0xFFFFB300; // ambre foncé
    const int numCouleurBase_3 = 0xFF4CAF50; //lightGreenAccent
    return MaterialApp(
      title: appTitle,
      /*theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      theme: monThemeData1(context, ambre),
      //theme: monThemeData2(context, numCouleurBase_1),
      //theme: monThemeData3(context),
      home: const MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          toolbarHeight: 98,
          title: const Titre(),
          /*Text("Titre",
        style: Theme.of(context).textTheme.headline1,),*/
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Theme.of(context).primaryColorLight,
            tabs: const [
              Tab(icon: Icon(Icons.hdr_auto)),
              //Tab(icon: Icon(Icons.abc_outlined,),),
              Tab(icon: Icon(Icons.keyboard)),
              Tab(icon: Icon(Icons.public)),
              Tab(icon: Icon(Icons.info)),
            ],
          ),
        ),
        body: TabBarView(children: [
          FutureBuilder<List<Lettre>?>(
              //future: _chargerHttp(http.Client()), // méthode 1
              future: _chargerRoot('assets/json/lettres.json'), // méthode 2
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError)
                // ignore: avoid_print
                {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? LettresList(
                        tabLettres: snapshot.data,
                        zoom: 1.0,
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              }),
          const Center(child: Clavier()),
          const Center(child: Liens()),
          const Center(child: Apropos()),
        ]),
      ),
    );
  }
}

/* ***** Chargement json : deux méthodes ****** */
// méthode 1, à consolider
/*
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
} */

// méthode 2 OK
//Future<List<Photo>> _chargerRoot() async {
Future<List<Lettre>?> _chargerRoot(String url) async {
  String jsonString = //await rootBundle.loadString('json/photos.json');
      //await rootBundle.loadString('https://drive.google.com/file/d/1AxJHclljcFX7b03G7B9G-QOuVDaNxlXS/view?usp=sharing');
      await rootBundle.loadString(url);
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
/* ********** */

class toto extends StatefulWidget {
  const toto({Key? key}) : super(key: key);

  @override
  State<toto> createState() => _totoState();
}

class _totoState extends State<toto> {
  @override
  Widget build(BuildContext context) {
    final String wordPair = "WordPair . aléatoire ()";
    return Text(wordPair);
  }
}

class titi extends StatelessWidget {
  const titi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
