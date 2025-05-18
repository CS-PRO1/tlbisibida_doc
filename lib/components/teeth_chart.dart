import 'package:flutter/material.dart';

// Assuming these data models and ToothBorder are defined in separate files
// or included here for completeness.

// Data Models
class ToothChartData {
  final Size size;
  final Map<int, Tooth> teeth;
  final Map<int, ToothConnection> connections;

  const ToothChartData({
    required this.size,
    required this.teeth,
    required this.connections,
  });

  // Helper to get selected teeth
  Set<Tooth> get selectedTeeth =>
      teeth.values.where((tooth) => tooth.selected).toSet();

  // Helper to get selected connections
  Set<ToothConnection> get selectedConnections =>
      connections.values.where((connection) => connection.selected).toSet();
}

class Tooth {
  Tooth(this.id, Path originalPath) {
    rect = originalPath.getBounds();
    path = originalPath.shift(-rect.topLeft);
  }

  final int id;
  late final Path path;
  late final Rect rect;
  bool selected = false;
  String? treatment;
  String? material;

  Color get color {
    switch (treatment) {
      case 'تاج': // Updated to Arabic
        return Colors.lime.shade200;
      case 'دمية': // Updated to Arabic
        return Colors.lightBlue.shade200;
      case 'زرعة': // Updated to Arabic
        return Colors.green.shade200;
      case 'فينير': // Updated to Arabic
        return Colors.pink.shade200;
      case 'حشوة': // Updated to Arabic
        return Colors.purple.shade200;
      case 'بدلة': // Updated to Arabic
        return Colors.red.shade200;
      default:
        return const Color(0xFFF8F5ED); // Default unselected color
    }
  }
}

class ToothConnection {
  ToothConnection(
      this.id, this.tooth1Id, this.tooth2Id, this.rect, Path originalPath) {
    rect = originalPath.getBounds();
    path = originalPath.shift(-rect.topLeft);
  }

  final int id;
  final int tooth1Id;
  final int tooth2Id;
  Path? path;
  Rect rect;
  bool selected = false;
}

class ToothBorder extends ShapeBorder {
  const ToothBorder(this.path);

  final Path path;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      getOuterPath(rect);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return rect.topLeft == Offset.zero ? path : path.shift(rect.topLeft);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = .9
      ..color = const Color(0xFFABA9A3); // Border color

    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) => this;
}
