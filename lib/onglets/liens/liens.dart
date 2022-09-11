//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'lien_navigateur.dart';
//import 'package:flutter_html/flutter_html.dart';
//import 'package:simple_html_css/simple_html_css.dart';

class Liens extends StatelessWidget {
  const Liens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child: ListView(children: [
          ListTile(
            title: Text(
              'Quelques liens utiles',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            //subtitle: const Text('Liste non exhaustive', textAlign: TextAlign.center,)
          ),
          widgetWeb(context),
          widgetAppli(context),
        ]));
  }
}

Widget widgetWeb(context) {
  final List<Widget> tab = [
    ListTile(
        leading: Icon(Icons.web, color: Theme.of(context).primaryColor),
        title: Text(
          'Sites Web :',
          style: Theme.of(context).textTheme.headline3,
          //style: Theme.of(context).textTheme.bodyText1,
        )),
    const LienNavigateur(
        lien: 'Dictionnaire DALLET',
        url:
            'https://adrar-inu.blogspot.com/2020/11/tasenfelt-tamaynut-n-umawal-n-dallet.html?fbclid=IwAR2Be9alShzhOfQpKKoGnZTrNiqO9HBxSnJVISsqnwlfvSvdHQKyXG7OfEs#more'),
    const LienNavigateur(
        lien: 'Adrar inu', url: 'https://adrar-inu.blogspot.com/'),
    const LienNavigateur(
        lien: 'Centre de Recherche Berbère Paris',
        url:
            'https://www.centrederechercheberbere.fr/transcription-kabyle.html'),
    const LienNavigateur(
        lien: 'Le verbe kabyle', url: 'https://www.amyag.com/'),
    const ListTile(title: Text(' ...')),
  ];
  return Column(children: tab);
}

Widget widgetAppli(context) {
  final List<Widget> tab = [
    ListTile(
        leading:
            Icon(Icons.apps_outlined, color: Theme.of(context).primaryColor),
        title: Text(
          'Applications Play Store :',
          style: Theme.of(context).textTheme.headline3,
        )),
    const ListTile(title: Text('- Amyag')),
    const ListTile(title: Text('- Tamsirt')),
    const ListTile(title: Text('- Lmd Tamazight')),
    const ListTile(title: Text('- Aselmed')),
    const ListTile(title: Text('- ...')),
  ];
  return Column(children: tab);
}
