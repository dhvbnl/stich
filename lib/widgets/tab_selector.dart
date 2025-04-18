import 'package:flutter/material.dart';
import 'package:stich/helpers/tab_state.dart';

class TabSelector extends StatefulWidget {
  const TabSelector({super.key, this.tabState = TabState.suggestions, required this.onTabChange});

  final TabState tabState;
  final ValueChanged<TabState> onTabChange;

  @override
  State<TabSelector> createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector> {
  late TabState _tabState;
  
  @override
  void initState() {
    super.initState();
    _tabState = widget.tabState;
  }

  @override
  void didUpdateWidget(TabSelector tabSelector) {
    super.didUpdateWidget(tabSelector);
    if(widget.tabState != tabSelector.tabState) {
      _tabState = widget.tabState;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFE2E8DD),
        borderRadius: BorderRadius.all(
          Radius.circular(9999),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: _tabBar(_tabState),
      ),
    );
  }

  Row _tabBar(TabState tabState) {
    if (tabState == TabState.suggestions) {
      return Row(
        children: [
          selectedTab(tabState),
          unselectedTab(
            TabState.closet,
            () {
              setState(
                () {
                  _tabState = TabState.closet;
                },
              );
              widget.onTabChange.call(_tabState);
            },
          ),
        ],
      );
    } else {
      return Row(
        children: [
          unselectedTab(
            TabState.suggestions,
            () {
              setState(
                () {
                  _tabState = TabState.suggestions;
                },
              );
              widget.onTabChange.call(_tabState);
            },
          ),
          selectedTab(tabState),
        ],
      );
    }
  }
}

Widget selectedTab(TabState tabState) {
  IconData icon =
      tabState == TabState.suggestions ? Icons.auto_awesome : Icons.checkroom;
  return Container(
    width: 135,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 12, 22, 24),
      borderRadius: BorderRadius.all(
        Radius.circular(9999),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFFE2E8DD),
            size: 18,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            tabState.name,
            style: const TextStyle(
              color: Color(0xFFE2E8DD),
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget unselectedTab(TabState tabState, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Icon(
        tabState == TabState.suggestions ? Icons.auto_awesome : Icons.checkroom,
        color: const Color(0xFF0C1618),
        size: 30,
      ),
    ),
  );
}


