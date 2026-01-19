import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ScrollProvider extends InheritedWidget {
  final ScrollController scrollController;

  const ScrollProvider({
    super.key,
    required this.scrollController,
    required super.child,
  });

  static ScrollController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ScrollProvider>()!
        .scrollController;
  }

  @override
  bool updateShouldNotify(ScrollProvider oldWidget) {
    return scrollController != oldWidget.scrollController;
  }
}

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final int delay;

  const ScrollReveal({super.key, required this.child, this.delay = 0});

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isVisible = false;
  ScrollController? _scrollController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController = ScrollProvider.of(context);
    _scrollController?.addListener(_checkVisibility);
    // Initial check
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_checkVisibility);
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  void _checkVisibility() {
    if (_isVisible) return; // Already revealed

    if (!mounted) return;

    // Find our render object
    final contextObject = context.findRenderObject();
    if (contextObject == null || !contextObject.attached) return;

    final renderObject = contextObject as RenderBox;
    if (_scrollController == null || !_scrollController!.hasClients) return;

    final viewport = RenderAbstractViewport.of(renderObject);
    // if (viewport == null) return; // Removed redundant check

    final scrollOffset = _scrollController!.offset;
    final viewportHeight = _scrollController!.position.viewportDimension;

    // Get the position of this widget relative to the viewport
    final revealOffset = viewport.getOffsetToReveal(renderObject, 0.0).offset;

    // Check if the top of the widget is within the viewport (with some buffer)
    // We want it to trigger when it scrolls slightly into view (e.g. 100px)
    final topVisible = revealOffset < scrollOffset + viewportHeight - 100;

    // Optional: check if it has passed the top (scrolled past)
    // final bottomVisible = ...

    if (topVisible) {
      if (!_isVisible) {
        setState(() {
          _isVisible = true;
          // Look up flutter_animate controller if we were using it directly,
          // or just rebuild to let Animate run if we toggle based on state.
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // If visible, run the animation.
    // We use a simple Key to force re-render or just use target.
    // Actually, flutter_animate's .animate() runs on load.
    // We can use `autoPlay: false` and `controller`.

    return widget.child
        .animate(target: _isVisible ? 1 : 0)
        .fade(duration: 500.ms, curve: Curves.easeOut)
        .slideY(begin: 0.2, end: 0, duration: 500.ms, curve: Curves.easeOut);
  }
}
