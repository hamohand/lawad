import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'liens/lien_navigateur.dart';

class Clavier extends StatelessWidget {
  const Clavier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child: ListView(children: [
          ListTile(
              title: Text(
                'Installation langue et clavier',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              subtitle: Text(
                'Android - Windows - Iphone',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              )),
          widgetAndroid(context),
          widgetWindow(context),
          widgetIphone(context)
        ]));
  }
}

Widget widgetAndroid(context) {
  final List<Widget> tab = [
    ListTile(
        leading: const Icon(Icons.android, color: Colors.blue),
        title: Text(
          'Android',
          style: Theme.of(context).textTheme.headline3,
        )),
    const ListTile(
        leading: Icon(Icons.settings),
        title: Text('Langue et clavier - Langue - Ajout d\'une langue')),
    const ListTile(
        leading: Icon(
          Icons.more_vert_rounded,
        ),
        title: Text('Toutes les langues')),
    const ListTile(
        title: Text('Sélectionner \'Taqbaylit\' dans la liste des langues')),
    const ListTile(
        title: Text(
            'Télécharger et installer l\'application \'KeyBer\' (préconisée par le groupe D AWAL !)')),
  ];
  return Column(children: tab); //ListView(children: tabAndroid);
}

Widget widgetWindow(context) {
  final List<Widget> tab = [
    ListTile(
        leading: const Icon(Icons.window, color: Colors.blue),
        title: Text(
          'Windows',
          style: Theme.of(context).textTheme.headline3,
        )),
    Row(children: const [
      LienNavigateur(
          lien: 'Youtube', url: 'https://www.youtube.com/watch?v=5S2wVF-PNa8'),
      LienNavigateur(
          lien: 'amawal.free.fr', url: 'http://amawal.free.fr/fontes.html'),
    ])
  ];
  return Column(children: tab);
}

Widget widgetIphone(context) {
  final List<Widget> tab = [
    ListTile(
        leading: const Icon(Icons.phone_iphone, color: Colors.blue),
        title: Text(
          'Iphone',
          style: Theme.of(context).textTheme.headline3,
        )),
    const ListTile(
        leading: Icon(Icons.youtube_searched_for), title: Text('à suivre')),
  ];
  return Column(children: tab);
}
