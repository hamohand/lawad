
import 'package:flutter/material.dart';

import '../../../models/lettre_model.dart';
import '../0_lettres_list.dart';
import '../lettre_son.dart';
import 'exemple_son.dart';

class AfficheDetails extends StatelessWidget {
  final Lettre? lettreDef;
  final int? index;
  // ignore: use_key_in_widget_constructors
  const AfficheDetails(this.lettreDef, this.index);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('${lettreDef?.lettre}'),
        ),
        body: Column(
          children: [
            boiteVide(),
            Row(
              children: [
                afficheLettre(context, lettreDef?.lettreMaj, 2),
                boiteVide(),
                afficheLettre(context, lettreDef?.lettre, 2),
                boiteVide(),
              ],
            ),
            Text('Prononciation(s)',
                style: Theme.of(context).textTheme.headline3),
            Text('et sons équivalents',
                style: Theme.of(context).textTheme.headline3),
            lesPrononciations_details(context, lettreDef),
          ],
        ));
    //
  }
}

/* */
// ignore: non_constant_identifier_names
Widget lesPrononciations_details(BuildContext context, lettreDef) {
  List<Widget> _prononciations = []; // tableau des prononciations s'il y a lieu
  for (var i = 0; i < lettreDef.prononciations.length; i++) {
    _prononciations.add(tabPrononciations_details(context, lettreDef, i));
  }
  return Column(children: _prononciations);
}

/* */
// ignore: non_constant_identifier_names
Widget tabPrononciations_details(
  //certaines lettres ont deux prononciations = tableau à 2 éléments
  BuildContext context,
  lettreDef,
  int? index,
  //TextStyle? styleDutexte
) {
  // éléments du tableau des prononciations s'il y a lieu
  return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    boiteVide(),
    Row(
      children: [
        const Text('-'),
        SonLettre(
          titre: lettreDef.lettre,
          fichier:
              'assets/audio_lettres/${lettreDef.prononciations[index].son}',
          couleurFond: Colors.transparent,
        ),

        afficheExemple_details(
            context,
            lettreDef.prononciations[index].exemple['texte'],
            Theme.of(context).textTheme.bodyText2,
            1.0),
        //boiteVide(),
        /* Icon(
          Icons.record_voice_over,
          color: Theme.of(context).primaryColor,
        ), */
        ExempleSon(
          titre: lettreDef.lettre,
          fichier:
              'assets/audio_exemples/${lettreDef.prononciations[index].exemple['son']}',
          couleurFond: Colors.transparent,
        ),
        boiteVide(),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.white)),
          child: Image.asset(
            'assets/images/lettres/${lettreDef.prononciations[index].image}',
            width: 150,
            //height: 40,
            //scale: 3.0,
          ),
        ),
      ],
    ),
    Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        children: [
          Icon(
            Icons.arrow_right_alt_outlined,
            color: Theme.of(context).primaryColor,
          ),
          RichText(
              text: TextSpan(
                  text: ' Français:',
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                TextSpan(
                  text: '${lettreDef.prononciations[index].francais}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ])),
          RichText(
              text: TextSpan(
                  text: ' Arabe:',
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                TextSpan(
                  text: '${lettreDef.prononciations[index].arabe}',
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ])),
        ],
      )
    ])
  ]);
}

/* */
// ignore: non_constant_identifier_names
Widget afficheExemple_details(BuildContext context, String? texteExemple,
    TextStyle? styleTexteTheme, double? taille) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    margin: const EdgeInsets.all(3.0),
    alignment: Alignment.centerLeft,
    //width: 120.0,
    child: Text(
      '$texteExemple',
      style: styleTexteTheme, //Theme.of(context).textTheme.bodyText1,
      //textScaleFactor: taille,
    ),
  );
}
