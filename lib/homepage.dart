// importation du package pour construire notre page - ce package contient les patrons (template) des widgets
import 'package:flutter/material.dart';

// création du widget homePage
// StateLessWidget : widget qui ne change pas d'état - image - texte 
// StateFullWidget : widget qui vont changer d'état - une zone de saisie

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  String motSaisi = "";

  @override
  Widget build(BuildContext context) {
    // une page contient un scaffold qui va permettre un empilement de widget
    return Scaffold(
      appBar: AppBar(
        // sous windows pour centrer le titre dans 
        //l'appBar  il faut rajouter la propriété : centerTitle: true,
        title:Text('Analyseur'),
      ),
      body: 
      /*
      Center(child: Text("Je vais analyser un mot",
      // la propriété style va nous permettre de changer la taille des caractères, de mettre une 
      // une nouvelle Police
      style: TextStyle(
        fontFamily:"Pacifico",  // les propriétés de notre texte 
        fontSize: 20.0,
        color:Colors.green
      ),)),*/

      // on passe un widget Column pour empiler des widgets
      // un widget Column contient des children (les widgets qu'on va empiler : champ de saisie 
      // - des cellules indicant les occurences)
      Column(children: [
        // les widgets de la colonne 
        // en premier on va mettre un widget pour saisir notre texte 
        // Widget TextField
        // on va envelopper notre widget TextField dans un widget Padding 
        Padding(
          // la propriété padding permet d'indiquer le positionnement 
          // top : ecartement par rapport au haut
          // left : la marge de gauche
          // rigth : la marge à droite
          // bottom : la marge du dessous
          padding: const EdgeInsets.only(top:10,left: 5,right: 5),
          child: TextField(
            // configuration de l'apparence de notre TextField
            decoration: InputDecoration(
              // hintText - equivalent d'un placeholder ( information à l'utilisateur)
              hintText:"Entrez votre mot",
              // border pour spécifier la bordurer de notre champ de saisie
              border: OutlineInputBorder(borderRadius:BorderRadius.circular(20))
            ) ,
            // le comportement de notre textField
            onChanged: (newValue){
              // pour mettre à jour notre notre variable d'état qui va stocker le mot saisi
              // si on oublie setState , la variable ne va pas être changer
              setState(() {
                // la saisie va être mise à jour 
                motSaisi = newValue;
                // $ : permet d'afficher  le contenu de la variable (string Interpolation)

                print("Mot saisi : $motSaisi");

              });
            },

          ),
        
        ),
       // On veut afficher le texte que si quelque chose a été saisi
       // une condition ternaire 
       // si mot saisi contient du text on affiche un widget Text avec le contenu saisi
       // sinon on affiche rien 
       motSaisi.isNotEmpty ? Text(
        "mot saisi est : $motSaisi",
        ) : const Text("")

      ],)

    );
  }
}


