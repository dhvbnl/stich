import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stich/helpers/constants.dart';
import 'package:stich/views/article_view.dart';

/// A widget that displays a button to add a photo either from the camera or the gallery.
class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

/// The state of the AddPhoto widget.
class _AddPhotoState extends State<AddPhoto>
    with SingleTickerProviderStateMixin {
  /// Animation controller for the pop‑in buttons.
  late final AnimationController _controller;

  /// Animation for the Camera Scale
  late final Animation<double> _cameraScale;

  /// Animation for the Camera Opacity
  late final Animation<double> _cameraOpacity;

  /// Animation for the Gallery Scale
  late final Animation<double> _galleryScale;

  /// Animation for the Gallery Opacity
  late final Animation<double> _galleryOpacity;

  /// Whether the pop‑in buttons are expanded or not.
  bool get _expanded =>
      _controller.status == AnimationStatus.forward ||
      _controller.status == AnimationStatus.completed;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );

    // Initialize the animations for the pop‑in buttons
    _cameraScale = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack));
    _cameraOpacity = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.55, curve: Curves.easeOut));

    _galleryScale = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOutBack));
    _galleryOpacity = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.75, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Distance each secondary button sits above the add/close button
  static const double _gap = kIconButtonSize + 10;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kIconButtonSize + _gap * 2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // The secondary buttons that pop in
          _PopButton(
            offsetY: -_gap,
            scale: _cameraScale,
            opacity: _cameraOpacity,
            iconData: Icons.photo_camera,
            tooltip: 'Take a picture',
            onTap: () async => _pick(context, ImageSource.camera),
          ),
          _PopButton(
            offsetY: -_gap * 2,
            scale: _galleryScale,
            opacity: _galleryOpacity,
            iconData: Icons.photo,
            tooltip: 'Pick from gallery',
            onTap: () async => _pick(context, ImageSource.gallery),
          ),
          // The main button that expands/collapses the secondary buttons
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              // Calculate the background color, icon color, and highlight color
              final double t = _controller.value;
              final Color backgroundColor =
                  Color.lerp(kSecondaryColor, kPrimaryColor, t)!;
              final Color iconColor =
                  Color.lerp(kPrimaryColor, kSecondaryColor, t)!;
              final Color highlightColor =
                  _expanded ? kSecondaryColor : kPrimaryColor;
              return IconButton.filled(
                style: IconButton.styleFrom(
                  minimumSize: const Size(kIconButtonSize, kIconButtonSize),
                  iconSize: 35,
                  backgroundColor: backgroundColor,
                  shape: const CircleBorder(),
                  highlightColor: highlightColor.withValues(
                    alpha: 0.2,
                  ),
                ),
                onPressed: () {
                  _expanded ? _controller.reverse() : _controller.forward();
                },
                icon: Transform.rotate(
                  angle: t * k45DegreeRad,
                  child: Icon(Icons.add, color: iconColor),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// Picks an image from the specified source and navigates to the ArticleView.
  /// [context] - The BuildContext to use for navigation.
  /// [source] - The source to pick the image from (camera or gallery).
  Future<void> _pick(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: source,
    );

    if (context.mounted && image != null) {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (_) => ArticleView(image: image)),
      );
    }
  }
}

/// Reusable widget for pop‑in buttons
/// [offsetY] - The vertical offset of the button.
/// [scale] - The scale animation for the button.
/// [opacity] - The opacity animation for the button.
/// [iconData] - The icon data for the button.
/// [onTap] - The callback function to be called when the button is tapped.
/// [tooltip] - The tooltip text for the button.
class _PopButton extends StatelessWidget {
  const _PopButton({
    required this.offsetY,
    required this.scale,
    required this.opacity,
    required this.iconData,
    required this.onTap,
    required this.tooltip,
  });

  final double offsetY;
  final Animation<double> scale;
  final Animation<double> opacity;
  final IconData iconData;
  final VoidCallback onTap;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scale,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, offsetY),
          child: Opacity(
            opacity: opacity.value,
            child: Transform.scale(
              scale: scale.value,
              child: child,
            ),
          ),
        );
      },
      child: IconButton.filled(
        tooltip: tooltip,
        style: IconButton.styleFrom(
          minimumSize: const Size(kIconButtonSize, kIconButtonSize),
          iconSize: 35,
          backgroundColor: kSecondaryColor,
          shape: const CircleBorder(),
        ),
        onPressed: onTap,
        icon: Icon(
          iconData,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
