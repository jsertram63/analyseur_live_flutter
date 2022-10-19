import 'package:flutter/material.dart';


class RowVoyelle extends StatelessWidget {
  const RowVoyelle({super.key, required this.letter, required this.colorRow, required this.textOccurences});
  final String letter; // on déclare une lettre pour construire le widget avec la bonne lettre
  final Color colorRow; // on déclare une couleur pour construire notre rangé
  final String textOccurences; // on déclare le nb d'occurences de la lettres

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45, // on spécifie la hauteur de nos rangées
      width: MediaQuery.of(context).size.width - 15, // on récupére la largeur de l'écran pour le mediaquerry
      decoration: BoxDecoration(
        color: colorRow,  /// <------ on passe la couleur de paramètres
        borderRadius:const BorderRadius.only(
         topLeft:const  Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      
      )
      
        
       ),  // on cherche à arrondir les angles de notre container

      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
         // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("${letter} :", /// <------- on affiche la lettre passée en paramètre
          style:TextStyle(fontFamily:"Pacifico",
          color: Colors.white,
          fontSize: 18.0
          )),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(textOccurences,
              style:TextStyle(fontFamily:"Pacifico",
            color: Colors.white,
            fontSize: 18.0
            )),
          ),
          
          
        ],),
      ),
    );
  }
}