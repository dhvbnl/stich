import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stich/helpers/tab_state.dart';
import 'package:stich/views/suggestions_view.dart';
import 'package:stich/widgets/tab_selector.dart';

void main() {
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
                const Expanded(child: SuggestionsView()),
              if (_selectedTab == TabState.closet)
                const Expanded(child: Placeholder()),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabSelector(
                      tabState: _selectedTab,
                      onTabChange: (newTab) {
                        setState(
                          () {
                            _selectedTab = newTab;
                          },
                        );
                      },
                    ),
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
      ),
    );
  }
}
