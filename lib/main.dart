import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stich/chat/chat.dart';
import 'package:stich/env/env.dart';
import 'package:stich/helpers/constants.dart';
import 'package:stich/helpers/tab_state.dart';
import 'package:stich/views/suggestions_view.dart';
import 'package:stich/widgets/tab_selector.dart';
import 'package:dart_openai/dart_openai.dart';

Future<void> main() async {
  OpenAI.apiKey = Env.apiKey;
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TabState _selectedTab = TabState.suggestions;
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: SafeArea(
          child: Column(
            children: [
              if (_selectedTab == TabState.suggestions)
                const Expanded(
                  child: SuggestionsView(),
                ),
              if (_selectedTab == TabState.closet)
                const Expanded(
                  child: Placeholder(),
                ),
              _bottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 40,
        right: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: TabSelector(
              initialTab: _selectedTab,
              onTabChange: (newTab) {
                setState(
                  () {
                    _selectedTab = newTab;
                  },
                );
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: IconButton.filled(
              style: IconButton.styleFrom(
                minimumSize: const Size(55, 55),
                iconSize: 35,
                backgroundColor: kSecondaryColor,
                shape: const CircleBorder(),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
