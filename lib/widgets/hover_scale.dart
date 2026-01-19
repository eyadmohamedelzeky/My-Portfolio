import 'package:flutter/material.dart';

class HoverScale extends StatefulWidget {
  final Widget? child;
  final Widget Function(bool isHovering)? builder;
  final double scale;
  final Duration duration;

  const HoverScale({
    super.key,
    this.child,
    this.builder,
    this.scale = 1.05,
    this.duration = const Duration(milliseconds: 200),
  }) : assert(
         child != null || builder != null,
         "Must provide child or builder",
       );

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _isHovering ? widget.scale : 1.0,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: widget.builder != null
            ? widget.builder!(_isHovering)
            : widget.child!,
      ),
    );
  }
}
