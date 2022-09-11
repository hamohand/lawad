import 'package:flutter/material.dart';

/* class monThemeData extends StatelessWidget {
  final int? numCouleurBase;

  monThemeData({Key? key, this.numCouleurBase}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData td = leThemeData(context, numCouleurBase);
    return td;
  }
} */

// Méthode 1 : thème prédéfini
monThemeData1(BuildContext context, couleur) {
  MaterialColor mesCouleurs = couleur;
  ThemeData td = ThemeData(
      primarySwatch: mesCouleurs,
      //bottomAppBarColor: mesCouleurs[500],
      //secondaryHeaderColor: mesCouleurs[500],
      primaryColor: mesCouleurs[900],
      brightness: Brightness.light,
      //brightness: Brightness.dark,
      //primaryColorLight: mesCouleurs[500],
      // primaryColorDark: mesCouleurs[500],
      cardColor: mesCouleurs[200],
      fontFamily: 'Times New Roman',
      textTheme: TextTheme(
        headline1: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(
              205, 1, 51, 0.9), //Theme.of(context).colorScheme.secondary,
          letterSpacing: 3,
        ),
        headline2: TextStyle(
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          letterSpacing: 6,
          color: Theme.of(context).colorScheme.secondary, //Colors.white
        ),
        headline3: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
          color: Theme.of(context).primaryColor, //Colors.white
        ),
        bodyText1: const TextStyle(
          fontSize: 15.0, fontFamily: 'times new roman', //color:Colors.black
          letterSpacing: 3,
        ),
        bodyText2: const TextStyle(
          fontSize: 20.0,
          fontFamily: 'times new roman',
          color: Color.fromRGBO(205, 1, 51, 1.0),
        ),
      ));

  return td; //méthode 1
  // print('Le nombre est : $numCouleurBase');
  // print('La couleur est : ${nuances[100]}');
}

// Méthode2 : construire des nuances de la couleur choisie
/******************************************************************/
monThemeData2(BuildContext context, numCouleurBase) {
  Color couleur = Color(numCouleurBase);

  Map<int, Color> nuances = {};
  int alpha = 25;
  nuances[50] = couleur.withAlpha(alpha); // initialisation
  for (int i = 100; i <= 900; i = i + 100) {
    alpha = alpha + 25;
    nuances[i] = couleur.withAlpha(alpha);
    print('La nuance est : $alpha');
  }
  print('La nuance est : $nuances');
  /*nuances = {
    50: const Color(0x194caf50),
    100: const Color(0x324caf50),
    200: const Color(0x4b4caf50),
    300: const Color(0x644caf50),
    400: const Color(0x7d4caf50),
    500: const Color(0x964caf50),
    600: const Color(0xaf4caf50),
    700: const Color(0xc84caf50),
    800: const Color(0xe14caf50),
    900: const Color(0xfa4caf50),
  };*/

  // Méthode2 : construire des nuances
  MaterialColor mesCouleurs2 = MaterialColor(numCouleurBase, nuances);
  //  OU Méthode2bis : nuances est une constante
  MaterialColor mesCouleurs2bis = MaterialColor(numCouleurBase, const {
    50: Color.fromRGBO(
        136, 14, 79, .1), // ou Color.fromARGB(0-255, 136, 14, 79,) par exple
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  });

  MaterialColor mesCouleurs = mesCouleurs2;
  // OU
  //MaterialColor mesCouleurs = mesCouleurs2bis;

  ThemeData td = ThemeData(
    primarySwatch: mesCouleurs,
    //primaryColor: nuances[500],
    //primaryColor: mesCouleurs1ter.shade200,
    brightness: Brightness.light,
    //brightness: Brightness.dark,
    //primaryColor: Colors.amber.shade500,
    /*primaryColorLight: Colors.amber.shade200,
    primaryColorDark: Colors.amber.shade800, */
    //primaryColorBrightness: Brightness.light,
    //primaryColorLight: nuances[100],
    // primaryColorDark: nuances[200],
    //accentColor: nuances[200],
    cardColor: mesCouleurs[200],
    //accentColor: Color(couleurBase2).withAlpha(100),
    textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(205, 1, 51, 0.5),
          letterSpacing: 3,
        ),
        headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
        bodyText1: TextStyle(
          fontSize: 14.0, fontFamily: 'times new roman', //color:Colors.black
        ),
        button: TextStyle(color: Colors.blue)),
  );

  return td; //méthode 2
}

/******************************************************************/
// Méthode 3 : construire un shémas, définir  toutes les propriétés
monThemeData3(BuildContext context) {
  ColorScheme cs1 = const ColorScheme(
      primary: Color.fromRGBO(1, 255, 1, 1),
      //primaryVariant: Color.fromRGBO(1, 100, 1, 1),
      primaryContainer: Color.fromRGBO(1, 100, 1, 1), // nouveau
      secondary: Color.fromRGBO(255, 255, 1, 1),
      //secondaryVariant: Color.fromRGBO(1, 1, 100, 1),
      secondaryContainer: Color.fromRGBO(1, 1, 100, 1),
      surface: Color.fromRGBO(255, 255, 1, 1),
      background: Color.fromRGBO(1, 255, 1, .3),
      error: Color.fromRGBO(100, 100, 100, 1),
      onPrimary: Color.fromRGBO(100, 100, 100, 1),
      onSecondary: Color.fromRGBO(100, 100, 0, 1),
      onSurface: Color.fromRGBO(100, 100, 100, 1),
      onBackground: Color.fromRGBO(100, 100, 100, 1),
      onError: Color.fromRGBO(100, 100, 100, 1),
      brightness: Brightness.light);

  ColorScheme cs2 = ColorScheme.fromSwatch(
    primarySwatch: Colors.green,
    //backgroundColor: Colors.indigo,
    //cardColor: Colors.indigoAccent,
  );

  ThemeData td = ThemeData.from(
    colorScheme: cs2,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
        letterSpacing: 3,
      ),
      bodyText1: TextStyle(color: Theme.of(context).colorScheme.primary),
    ),
  );
  // print('Le nombre est : $numCouleurBase');
  return td; //méthode 3
}

/*
monThemeData4(BuildContext context) {
  Theme(
    data: ThemeData.from(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondaryContainer,
          letterSpacing: 3,
        ),
        bodyText1: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    ),
    child: Builder(
      builder: (BuildContext context) {
        return Container(
          width: 100,
          height: 100,
          color: Theme.of(context).colorScheme.primary,
          child: Center(
            child: Text("Toto",
              style: Theme.of(context).textTheme.headline1),
          ),
        );
      },
    ),
  );
}*/
