import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stich/widgets/tab_selector.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        body: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TabSelector(),
                  IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFF0C1618),
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Color(0xFFE2E8DD),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // home: CupertinoTabScaffold(
      //   tabBar: CupertinoTabBar(items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.auto_awesome), label: 'Suggestions'),
      //     BottomNavigationBarItem(icon: Icon(Icons.checkroom), label: 'Closet')
      //   ]),
      //   tabBuilder: (BuildContext context, int index) {
      //     if (index == 0) {
      //       return const Suggestions();
      //     } else {
      //       return const Closet();
      //     }
      //   },
      // ),
    );
  }
}

class Suggestions extends StatelessWidget {
  const Suggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              //Text('Stich', style: GoogleFonts.miniver(textStyle: TextStyle(fontSize: 30))),

              TabSelector(),
            ],
          ),
        ),
        Spacer()
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
