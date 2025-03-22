import 'package:flutter/material.dart';
import 'package:premier_projet/modeles/personne.dart';
import 'package:premier_projet/widgets/bottomNav.dart';
import 'package:premier_projet/widgets/menuDrawer.dart';

class PageCommunaute extends StatefulWidget {
  PageCommunauteState createState() => PageCommunauteState();
}

class PageCommunauteState extends State<PageCommunaute> {
  List<Personne> listePersonnes = [
    Personne(1, 'Lil Baby', 'Developpeur', 773432847,
        'https://tse1.mm.bing.net/th?id=OIP.xyvcsvHQi4nALv97vqGlaAHaHa&pid=Api&P=0&h=180'),
    Personne(2, 'Freeze Corleone', 'Scientifique', 773890399,
        'https://tse1.mm.bing.net/th?id=OIP.7Wlhi8OxoCwR7ZxEL8yYegHaEo&pid=Api&P=0&h=180'),
    Personne(3, 'Gazo', 'Peintre', 788766554,
        'https://tse2.mm.bing.net/th?id=OIP.qluqFtJuVqa0QUKTnEaOCAHaEM&pid=Api&P=0&h=180'),
    Personne(4, 'osirus jack', 'ecrivain', 778465778,
        'https://tse3.mm.bing.net/th?id=OIP.Bhqg8rZkTwD_OiAhh3Fl7AHaGU&pid=Api&P=0&h=180'),
    Personne(5, 'Ninho', 'actrice', 778762321,
        'https://tse1.mm.bing.net/th?id=OIP.6ftifnyqO9MH_QUKHimGawHaE7&pid=Api&P=0&h=180'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuDrawer(),
        bottomNavigationBar: BottomNav(
          indexselection: 1,
        ),
        appBar: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            title: const Text(
              "Page Communauté",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
        body: builListView());
  }

  ListView builListView() {
    return ListView.separated(
      itemCount: listePersonnes.length,
      itemBuilder: (context, index) {
        final pers = listePersonnes.elementAt(index);
        final item = listePersonnes.elementAt(index).nom;

        return Container(
          key: Key(pers.id.toString()),
          child: getLisTile(index, context, item),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.blue,
      ),
    );
  }

  ListTile getLisTile(int index, BuildContext context, String item) {
    Personne pers = listePersonnes[index];
    return ListTile(
      title: Text("${pers.nom}"),
      subtitle: Text(pers.metier + " Tel.:${pers.telephone}"),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(pers.imageProfil),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.blue,
        ),
        onPressed: () {
          setState(() {
            listePersonnes.removeAt(index);
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('$item a étè supprimé de le liste'),
            //Optional duration
          ));
        },
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                getAlertDialogInfosPersonne(pers, context));
      },
    );
  }

  AlertDialog getAlertDialogInfosPersonne(Personne pers, BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red,
      title: Text(
        "Détails des informations",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      content: getAlerDialogsDetailInfos(pers),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }

  getAlerDialogsDetailInfos(Personne pers) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(pers.imageProfil),
                radius: 90,
              ),
              Text(
                pers.metier,
                textAlign: TextAlign.center,
                textScaleFactor: 2.0,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                pers.telephone.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 2.0,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
