import 'package:flutter/material.dart';

class SkeletonContainer extends StatefulWidget {
  final String text;
  final TextStyle style;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final Color color;
  final Duration duration;

  const SkeletonContainer({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius = BorderRadius.zero,
    this.color = const Color(0xFF313131),
    this.duration = const Duration(milliseconds: 1200),
    required this.text,
    required this.style,
  }) : super(key: key);

  @override
  _SkeletonContainerState createState() => _SkeletonContainerState();
}

class _SkeletonContainerState extends State<SkeletonContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              color: widget.color,
            ),
            child: Text(
              widget.text,
              style: widget.style,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
