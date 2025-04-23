import 'package:flutter/material.dart';
import 'package:stich/helpers/constants.dart';
import 'package:stich/helpers/tab_state.dart';

/// A widget that displays two unselected tabs (Suggestions and Closet).
class UnselectedTabsRow extends StatelessWidget {
  const UnselectedTabsRow({
    super.key,
    required this.unselectedWidth,
    required this.onTap,
  });

  // The width of the unselected tabs.
  final double unselectedWidth;
  // Callback function to be called when a tab is tapped.
  final ValueChanged<TabState> onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _UnselectedTab(
          tab: TabState.suggestions,
          width: unselectedWidth,
          onTap: () => onTap(TabState.suggestions),
        ),
        const Spacer(),
        _UnselectedTab(
          tab: TabState.closet,
          width: unselectedWidth,
          onTap: () => onTap(TabState.closet),
        ),
      ],
    );
  }
}

/// A widget that represents an unselected tab.
class _UnselectedTab extends StatelessWidget {
  const _UnselectedTab({
    required this.tab,
    required this.width,
    required this.onTap,
  });

  // The tab state (Suggestions or Closet).
  final TabState tab;
  // The width of the tab.
  final double width;
  // Callback function to be called when the tab is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Icon(
          tab == TabState.suggestions ? Icons.auto_awesome : Icons.checkroom,
          color: kSecondaryColor,
          size: 30,
        ),
      ),
    );
  }
}
