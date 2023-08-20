import 'package:flutter/material.dart';

class CustomButtonShape extends ShapeBorder {
  const CustomButtonShape({
    this.borderRadius = 16,
    this.alignment = Alignment.centerLeft,
  }) : assert(
          alignment == Alignment.centerLeft || alignment == Alignment.centerRight,
          "alignment must be either centerLeft or centerRight,todo😁",
        );

  final double? borderRadius;
  final Alignment alignment;

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final radius = rect.height / 5;

    final center = switch (alignment) {
      Alignment.centerLeft => rect.centerLeft,
      Alignment.centerRight => rect.centerRight,
      _ => throw Exception("alignment must be either centerLeft or centerRight,todo😁"),
    };

    final cutRect = Rect.fromCircle(center: center, radius: radius);

    final cutPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          cutRect,
          const Radius.circular(20),
        ),
      );
    final roundedRectPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          rect,
          const Radius.circular(20),
        ),
      );

    final Path path = Path.combine(
      PathOperation.difference,
      roundedRectPath,
      cutPath,
    );

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getInnerPath(rect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
