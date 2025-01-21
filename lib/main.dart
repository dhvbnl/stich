import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoApp(
        home: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: 'Suggestions'),
            BottomNavigationBarItem(icon: Icon(Icons.checkroom), label: 'Closet')
          ]),
          tabBuilder: (BuildContext context, int index){
            if(index == 0){
              return Suggestions();
            } else {
              return Closet();
            }
            return Placeholder();
          },
        ),
      ),
    );
  }
}

class Suggestions extends StatelessWidget {
  const Suggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
          children: [
            //Text('Stich', style: GoogleFonts.miniver(textStyle: TextStyle(fontSize: 30))),
            const Spacer()
          ],),
        ), 
        const Spacer()
      ],
    );
  }
}


class Closet extends StatelessWidget {
  const Closet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

