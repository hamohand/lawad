import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Apropos extends StatelessWidget {
  const Apropos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.amber.shade800,
          title: Text(
            'A propos',
            textScaleFactor: 1,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        body: regledor(context));
  }
}

Widget regledor(context) {
  return Card(
      margin: const EdgeInsets.all(5),
      //color: Colors.tealAccent[100],
      //shadowColor: Colors.blueGrey.shade50,
      elevation: 10,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ListTile(
          leading: Image.asset(
            'assets/images/africa-north-transparent.png',
            width: 100,
            // height: 52,
            color: Theme.of(context).primaryColor,
          ),
          /* Icon(Icons.app_registration,
              color: Theme.of(context).primaryColor, size: 45), */
          title: const Text(
            "wagiDAWALiw",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: const Text('version 1.0 - décembre 2021'),
        ),
        /* */

        Text.rich(
          TextSpan(
            style: Theme.of(context).textTheme.bodyText1,
            children: <TextSpan>[
              const TextSpan(
                text: 'Avec le coucours du groupe Facebook ',
                style: TextStyle(height: 2, letterSpacing: 3, fontSize: 12),
              ),
              const TextSpan(
                text: 'D AWAL !',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 2,
                    letterSpacing: 3,
                    fontSize: 12),
              ),
              const TextSpan(
                text: ' (plus de 4000 membres en août 2021). ',
                style: TextStyle(height: 1.5, letterSpacing: 3, fontSize: 12),
              ),
              TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                text: '  ',
              ),
            ],
          ),
        ),
        Text.rich(// vide
            TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                children: const <TextSpan>[
              TextSpan(
                text: '  ',
              ),
              TextSpan(
                  text:
                      'WagiDAWALiw est un outil d\'aide à portée de main, simple et pratique dédié à la transcription en tamazight, à mettre entre toutes les mains. Il s\'adresse essentiellement à un public berbérophone désirant franchir le pas pour enfin écrire en tamazight. Une application évolutive grâce au concours des membres de notre groupe.',
                  style: TextStyle(fontSize: 12.0)),
            ])),
        Text.rich(TextSpan(
            style: Theme.of(context).textTheme.bodyText1,
            children: const [
              TextSpan(
                text: 'Mots-clés : ',
                style: TextStyle(
                    height: 2, fontWeight: FontWeight.bold, letterSpacing: 2),
              ),
              TextSpan(
                text: 'aru, tamaziƔt, agemmay, écrire, berbère, alphabet.',
                style: TextStyle(letterSpacing: 2, fontSize: 12),
              ),
            ])),
        const Text(
          'Contact : wagidawaliw@gmail.com',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        const Text(
          'Muhend At Yeǧǧer',
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 10, color: Colors.black54),
        ),
      ]));
}
