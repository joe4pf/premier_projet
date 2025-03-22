import 'package:flutter/material.dart';
import 'package:premier_projet/screens/login_screen.dart';
import 'package:premier_projet/widgets/bottomNav.dart';
import 'package:premier_projet/widgets/menuDrawer.dart';

void main() {
  runApp(MyApp());
}

//center
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "premier application",
        home: LoginScreen());
  }
}

class PageAccueil extends StatefulWidget {
  PageAccueilState createState() => PageAccueilState();
}

class PageAccueilState extends State<PageAccueil> {
  int nbrelikes = 0;
  int nbredislikes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomNav(
        indexselection: 0,
      ),
      appBar: AppBar(
          title: const Text(
        "Page Accueil",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/FREEZE.jpeg",
            ),
            Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'Rencontrer WADE, le roi autoproclamé des gaffes technologiques!'
                  'Avec ses talents comiques aussi aiguisés qu\'un coutaeu émousé,'
                  'il navigue maladroitement à travers les méandres de la technologie, semant chaos et hilarité sur son passage.'
                  'Armé d\'un humour aussi imprévisible que ses clics malencontreux,'
                  'WADE transforme chaque tentative de résolution de probléme en un spectacle comique inoubliable.'
                  'Mais malgres ses maladresses, son esprit jovial et sa capacité a rire de lui-meme font de lui un compagnon trap,'
                  'apportant une touche de légérité à chaque situation. Dans le monde complexe de la tech,'
                  'WADE est le clown bien-aimé, toujours pret à faire rire et à transformer les erreurs en anecdotes mémoriables',
                  softWrap: true,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      iconSize: 50,
                      onPressed: () {
                        setState(() {
                          nbrelikes++;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "${nbrelikes}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.thumb_down),
                        iconSize: 50,
                        onPressed: () {
                          setState(() {
                            nbredislikes++;
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "${nbredislikes}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.red),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
