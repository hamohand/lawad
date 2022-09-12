import 'package:flutter/material.dart';
import '../../models/lettre_model.dart';
import 'details/affiche_details.dart';
import 'lettre_pronociations.dart';

class LettresList extends StatelessWidget {
  final List<Lettre>? tabLettres;
  final double? zoom;

  const LettresList({Key? key, this.tabLettres, this.zoom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return laListe(context, tabLettres, zoom);
  }
}

Widget laListe(BuildContext context, tabLettres, zoom) {
  Color? couleurFondClair = Theme.of(context).primaryColorLight;
  Color? couleurFondFonce = Theme.of(context).backgroundColor;
  Color? couleurFond = couleurFondFonce; // initialisée à foncé
  //
  return ListView.builder(
      padding: const EdgeInsets.all(2),
      itemCount: tabLettres.length,
      itemBuilder: (BuildContext context, int? index) {
        (couleurFond == couleurFondFonce)
            ? couleurFond = couleurFondClair
            : couleurFond = couleurFondFonce;
        return Container(
            color: couleurFond,
            child: Row(
              children: [
                afficheLettre(context, tabLettres[index].lettreMaj, zoom * 1.2),
                afficheLettre(context, tabLettres[index].lettre, zoom * 1.2),
                LettrePrononciations(
                    lettreDef: tabLettres[index],
                    couleurFond: couleurFond,
                    zoom: zoom),
                details(context, tabLettres[index], index),
              ],
            ));
      });
}

/* */
Widget afficheLettre(BuildContext context, String? lalettre, double? taille) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(width: 0.5, color: Theme.of(context).primaryColorDark),
        borderRadius: const BorderRadius.all(Radius.circular((18)))),
    margin: const EdgeInsets.all(1.0),
    alignment: Alignment.center,
    width: 28.0,
    child: // Expanded( child:
        Text(
      '$lalettre',
      style: Theme.of(context).textTheme.bodyText2,
      textScaleFactor: taille,
    ),
    //)
  );
}

/* */
Widget boiteVide() {
  return Container(
    color: Colors.transparent,
    width: 10.0,
    //height: 30.0,
    child: const Text(''),
  );
}

/* */
Widget details(BuildContext context, lettreDef, index) {
  return IconButton(
    // icon: const Icon(Icons.record_voice_over),
    icon: const Icon(Icons.more_horiz_rounded),
    //color: Colors.lightGreen,
    color: Theme.of(context).primaryColor,
    // hoverColor: Colors.red,
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AfficheDetails(lettreDef, index)));
    },
  );
}