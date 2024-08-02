import 'package:flutter/material.dart';

class ExpandedSection extends StatefulWidget {
  const ExpandedSection({Key? key, required this.expand, required this.child}) : super(key: key);
  final bool expand;
  final Widget child;
  @override
  State<ExpandedSection> createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    animate();
    check();
  }

  animate() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation =
        CurvedAnimation(parent: controller!, curve: Curves.easeInOutBack);
  }

  check() {
    if (widget.expand) {
      controller!.forward();
    } else {
      controller!.reverse();
    }
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    check();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation!,
      child: widget.child,
    );
  }
}
