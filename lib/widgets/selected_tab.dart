import 'package:flutter/material.dart';
import 'package:stich/helpers/constants.dart';
import 'package:stich/helpers/tab_state.dart';

/// A widget that displays the selected tab (Suggestions or Closet).
class SelectedTab extends StatelessWidget {
  const SelectedTab({
    super.key,
    required this.tab,
    required this.width,
  });

  // The tab state (Suggestions or Closet).
  final TabState tab;
  // The width of the tab.
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: kTabBarHeight,
      decoration: const BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.all(kMaxRadius),
      ),
      padding: const EdgeInsets.all(10),
      // The AnimatedSwitcher widget is used to animate the transition
      child: AnimatedSwitcher(
        duration: kDurationShort,
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: Row(
          key: ValueKey<TabState>(tab),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              tab == TabState.suggestions
                  ? Icons.auto_awesome
                  : Icons.checkroom,
              color: kPrimaryColor,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              tab.name,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
