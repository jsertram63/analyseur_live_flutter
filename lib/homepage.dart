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

    // définition d'un controller qui va observer l'évolution de notre champs de saisi
    late TextEditingController saisieController;

  


    // On va initialiser notre controleur dans le initState
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // instancier le controller - réserve l'espace mémoire
    saisieController = TextEditingController();
    saisieController.addListener(_ecouteurText); // <---- on branche notre écouteur
  }

  // définition de notre fonction d'écoute
  void _ecouteurText(){
      // on passe ici quand on va saisir du texte
      print("passage dans fonction ecouteurs");
      setState(() {
        motSaisi = saisieController.text;
        print(saisieController.text);
      });
  }


  void _analyserMot(){
    print("Analyse mot");
    // la strategie : parcourir notre chaine de caractère , les caractères les uns apres les autres 
    // on va dans le bon cas : switch
    _resetDico();
    motSaisi = motSaisi.toLowerCase();
    
    print(motSaisi);
    for(var i=0; i<motSaisi.length;i++){
        // un switch pour incrémenter la bonne lettre dans notre voyelleDico
        switch(motSaisi[i]){
           case 'a': 
                incremente(motSaisi[i]);
                print("a"); // _incrementeA()
            break;
           case 'e': print("e"); 
           incremente(motSaisi[i]);// _incremnenteE
            break;
            incremente(motSaisi[i]);
            case 'i': print("i");
            break;
            incremente(motSaisi[i]);
            case 'o': print("o");
            incremente(motSaisi[i]);
            break;
            case 'u': print("u");
            incremente(motSaisi[i]);
            break;
            case 'y':print("y");
            incremente(motSaisi[i]);
            break;
            default: print("consonnes");
            nbConsonnes++;

          

        }
    }
    print(voyelleDico);
    print('$nbConsonnes consonnes');
  }


    // définition de notre map ayant pour clé un string (notre voyelle) et valeur : un entier (le nombre d'occurences)
    Map <String,int> voyelleDico = {'a':0,'e':0,'i':0,'o':0,'u':0,"y":0};
    int nbConsonnes = 0;

  // reset : remise à zero de notre map
  void _resetDico(){
    nbConsonnes = 0;
    // on va parcourir notre voyelleDico pour remettre à zero
    setState(() {
      voyelleDico.forEach((key, value) { // 'a':9 , 'e':2
          voyelleDico[key] = 0;
      });
    });
  }


  // fonction qui incrémente A
  /*
  void _incrementeA(){
    setState(() {
      // on va récupérer la valeur courante dans notre dictionne voyelleDico
      int? valeur = voyelleDico['a'];
      valeur = valeur! + 1; // le point d'exclamation va déballer la variable
      voyelleDico['a'] = valeur;
    });
  }

  // fonction qui incrémente E
    void _incrementeE(){
    setState(() {
      // on va récupérer la valeur courante dans notre dictionne voyelleDico
      int? valeur = voyelleDico['e'];
      valeur = valeur! + 1; // le point d'exclamation va déballer la variable
      voyelleDico['e'] = valeur;
    });
  }

  // fonction qui incrémente i 
    void _incrementeI(){
    setState(() {
      // on va récupérer la valeur courante dans notre dictionne voyelleDico
      int? valeur = voyelleDico['i'];
      valeur = valeur! + 1; // le point d'exclamation va déballer la variable
      voyelleDico['i'] = valeur;
    });
  }

    // fonction qui incrémente O
      void _incrementeO(){
    setState(() {
      // on va récupérer la valeur courante dans notre dictionne voyelleDico
      int? valeur = voyelleDico['o'];
      valeur = valeur! + 1; // le point d'exclamation va déballer la variable
      voyelleDico['o'] = valeur;
    });
  }

  // fonction qui incrémente U
      void _incrementeU(){
    setState(() {
      // on va récupérer la valeur courante dans notre dictionne voyelleDico
      int? valeur = voyelleDico['u'];
      valeur = valeur! + 1; // le point d'exclamation va déballer la variable
      voyelleDico['u'] = valeur;
    });
  }
      void _incrementeY(){
    setState(() {
      // on va récupérer la valeur courante dans notre dictionne voyelleDico
      int? valeur = voyelleDico['y'];
      valeur = valeur! + 1; // le point d'exclamation va déballer la variable
      voyelleDico['y'] = valeur;
    });
  }*/

  void incremente(String charac){
    setState(() {
      int? valeur = voyelleDico[charac];
      valeur = valeur! + 1;
      voyelleDico[charac] = valeur;
    });
  }


  String motSaisi = "";

  @override
  Widget build(BuildContext context) {
    // une page contient un scaffold qui va permettre un empilement de widget
    return Scaffold(
      // drawer : va permettre de mettre un menu dans l'application
      drawer: Drawer(
        child: ListView(
        children: [
          // Drawer header : va permettre de mettre une photo tel un avatar
         DrawerHeader(
           decoration: const BoxDecoration(color: Colors.blue),
          child:Column(children: [
          // On va empiler un texte et une photo
          Text("Menu",style: TextStyle(fontFamily:"pacifico",fontSize: 20, color: Colors.white)),
          SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(backgroundImage: AssetImage('images/abc.png')),
          )   
         ],
        
         )),
         // on définit une tuile qui va etre un onglet de notre menu
         ListTile(
          // on définit une cellule pour notre section dans row (icone + texte)
          title: Row(
            children: [
              Icon(Icons.abc_outlined,size: 26,color: Colors.black,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Analyser"),
              ),
            ],
          ),

         ),
          ListTile(
           title: Row(
            children: [
              Icon(Icons.history,size: 26,color: Colors.black,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Historique"),
              ),
            ],
          ),

         ),
          ListTile(
           title: Row(
            children: [
              Icon(Icons.info,size: 26,color: Colors.black,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("A propos"),
              ),
            ],
          ),

         ),
         ///////

        ],
      ),),
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
            // 1ere méthode pour controller le champs de saisie
            /*onChanged: (newValue){
              // pour mettre à jour notre notre variable d'état qui va stocker le mot saisi
              // si on oublie setState , la variable ne va pas être changer
              setState(() {
                // la saisie va être mise à jour 
                motSaisi = newValue;
                // $ : permet d'afficher  le contenu de la variable (string Interpolation)

                print("Mot saisi : $motSaisi");

              });
            },*/
            // 2 eme méthode pour controller le champs de saisi
            controller: saisieController,

          ),
        
        ),
       // On veut afficher le texte que si quelque chose a été saisi
       // une condition ternaire 
       // si mot saisi contient du text on affiche un widget Text avec le contenu saisi
       // sinon on affiche rien 
       motSaisi.isNotEmpty ? Text(
        "mot saisi est : $motSaisi",
        ) : const Text(""),
        // on définit un bouton
        // _analyserMot (fonction qui va anlyser le mot)
        ElevatedButton(onPressed: _analyserMot, child: const Text("Analyser",
        style: TextStyle(fontFamily:"pacifico",fontSize: 20),),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          textStyle: MaterialStateProperty.all(const TextStyle(fontFamily:"pacifico",fontSize: 30))
        ),
        ),
    

      ],
      
      )

    );
  }
   

}




