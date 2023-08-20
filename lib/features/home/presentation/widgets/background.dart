import 'dart:math' as math;

import 'package:flutter/material.dart';

/// use a PaLM tree animation if possible
/// else colorize the background
class HomePageBackground extends StatefulWidget {
  const HomePageBackground({super.key});

  @override
  State<HomePageBackground> createState() => _HomePageBackgroundState();
}

class _HomePageBackgroundState extends State<HomePageBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "(•‿•)",
      ),
    );
  }
}
