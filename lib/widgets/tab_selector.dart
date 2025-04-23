import 'package:flutter/material.dart';
import 'package:stich/helpers/constants.dart';
import 'package:stich/helpers/tab_state.dart';
import 'package:stich/widgets/selected_tab.dart';
import 'package:stich/widgets/unselected_tab_row.dart';

/// A widget that allows the user to select between two tabs
/// (Suggestions and Closet).
/// It uses a sliding animation to indicate the selected tab.
class TabSelector extends StatefulWidget {
  const TabSelector({
    super.key,
    this.initialTab = TabState.suggestions,
    required this.onTabChange,
  });

  /// The initial tab to be displayed.
  final TabState initialTab;

  /// Callback function to be called when the tab changes.
  final ValueChanged<TabState> onTabChange;

  @override
  State<TabSelector> createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector> {
  // The current tab state.
  late TabState _current;

  // The position of the selected tab when dragging.
  late double _position;

  // Whether the user is currently dragging the tab.
  bool _isDragging = false;

  // The offset of the finger when dragging.
  double? _fingerOffset;

  @override
  void initState() {
    super.initState();
    _current = widget.initialTab;
    _position = _current == TabState.suggestions ? 0 : 1;
  }

  @override
  void didUpdateWidget(covariant TabSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialTab != widget.initialTab) {
      _current = widget.initialTab;
    }
  }

  /// Changes the current tab to the next tab.
  void _changeTab(TabState next) {
    if (next == _current) return;
    setState(() => _current = next);
    widget.onTabChange(next);
    _position = next == TabState.suggestions ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the width of the selected and unselected tabs.
        final selectedW = constraints.maxWidth / 1.75;
        final unselectedW = constraints.maxWidth - selectedW;
        // Calculate the travel distance for the selected tab.
        final travel = constraints.maxWidth - selectedW;

        return GestureDetector(
          onHorizontalDragStart: (details) {
            // Get the position of the finger when dragging starts.
            final box = context.findRenderObject() as RenderBox;
            final dx = box.globalToLocal(details.globalPosition).dx;

            // Calculate the position of the selected tab.
            final thumb = selectedW / 2 + _position * travel;
            // Calculate the offset of the finger.
            _fingerOffset = dx - thumb;
            setState(() => _isDragging = true);
          },
          onHorizontalDragUpdate: (details) {
            final box = context.findRenderObject() as RenderBox;
            final dx = box.globalToLocal(details.globalPosition).dx;
            final thumb = (dx - (_fingerOffset ?? 0))
                .clamp(selectedW / 2, selectedW / 2 + travel);
            // Calculate the new position of the selected tab.
            final fraction = (thumb - selectedW / 2) / travel;

            setState(() {
              // Update the position of the selected tab.
              _position = fraction;
              if (fraction < 0.5) {
                _current = TabState.suggestions;
                widget.onTabChange.call(_current);
              } else {
                _current = TabState.closet;
                widget.onTabChange.call(_current);
              }
            });
          },
          onHorizontalDragEnd: (_) {
            setState(() {
              // reset the finger offset and dragging state.
              _fingerOffset = null;
              _isDragging = false;

              // Calculate the final position of the selected tab.
              if (_position < 0.5) {
                _position = 0;
                _current = TabState.suggestions;
              } else {
                _position = 1;
                _current = TabState.closet;
              }
              // Call the callback function with the new tab state.
              widget.onTabChange.call(_current);
            });
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE2E8DD),
              borderRadius: BorderRadius.all(kMaxRadius),
            ),
            padding: const EdgeInsets.all(5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Unselected tabs row
                UnselectedTabsRow(
                  unselectedWidth: unselectedW,
                  onTap: _changeTab,
                ),
                // Selected tab
                AnimatedAlign(
                  duration: _isDragging ? kDurationNone : kDurationMedium,
                  curve: kCurve,
                  alignment: FractionalOffset(_position, 0),
                  child: SelectedTab(
                    tab: _current,
                    width: selectedW,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
