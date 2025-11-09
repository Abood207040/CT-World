import 'package:flutter/material.dart';

class FadeInPage extends StatefulWidget {
  final Widget child;
  const FadeInPage({super.key, required this.child});

  @override
  State<FadeInPage> createState() => _FadeInPageState();
}

class _FadeInPageState extends State<FadeInPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _fadeAnimation, child: widget.child);
  }
}
