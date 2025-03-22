import 'package:flutter/material.dart';
import 'package:premier_projet/main.dart';
import 'package:premier_projet/screens/communaute_screen.dart';

class BottomNav extends StatefulWidget {
  int indexselection;
  BottomNav({super.key, required this.indexselection});
  //BottomNav({Key?key});
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  void getSelectItem() {
    switch (widget.indexselection) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageAccueil()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageCommunaute()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          label: "Accueil",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Communauté",
          icon: Icon(Icons.person),
        )
      ],
      currentIndex: widget.indexselection,
      onTap: (newIndex) {
        setState(() {
          widget.indexselection = newIndex;
          getSelectItem();
        });
      },
    );
  }
}
