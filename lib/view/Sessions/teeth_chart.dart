import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:xml/xml.dart';

class ToothChart extends StatelessWidget {
  final String svgAsset;
  final Map<int, ToothStyle> toothStyles;
  final Set<int> selectedConnections;

  const ToothChart({
    Key? key,
    required this.svgAsset,
    this.toothStyles = const {},
    this.selectedConnections = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ToothChartData>(
      future: _loadChartData(svgAsset),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();

        final data = snapshot.data!;

        return FittedBox(
          child: SizedBox.fromSize(
            size: data.size,
            child: Stack(
              children: [
                // Render teeth
                for (final tooth in data.teeth.values)
                  Positioned.fromRect(
                    rect: tooth.rect,
                    child: _ToothWidget(
                      tooth: tooth,
                      style: toothStyles[tooth.id],
                    ),
                  ),
                // Render connections
                for (final connection in data.connections.values)
                  Positioned.fromRect(
                    rect: connection.rect,
                    child: _ConnectionWidget(
                      connection: connection,
                      isSelected: selectedConnections.contains(connection.id),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<ToothChartData> _loadChartData(String asset) async {
    final xml = await rootBundle.loadString(asset);
    final doc = XmlDocument.parse(xml);
    final viewBox = doc.rootElement.getAttribute('viewBox')!.split(' ');
    final size = Size(
      double.parse(viewBox[2]),
      double.parse(viewBox[3]),
    );

    final teeth = doc.rootElement.findAllElements('path');
    final connections = <int, ToothConnection>{};

    for (final tooth in teeth) {
      final id = int.parse(tooth.getAttribute('id')!);
      if (id >= 100) {
        connections[id] = ToothConnection(
          id: id,
          tooth1Id: _generateConnectionIds(id).$1,
          tooth2Id: _generateConnectionIds(id).$2,
          path: parseSvgPathData(tooth.getAttribute('d')!),
        );
      }
    }

    return ToothChartData(
      size: size,
      teeth: <int, Tooth>{
        for (final tooth in teeth)
          if (int.parse(tooth.getAttribute('id')!) < 100)
            int.parse(tooth.getAttribute('id')!): Tooth(
              id: _generateToothId(int.parse(tooth.getAttribute('id')!)),
              path: parseSvgPathData(tooth.getAttribute('d')!),
            ),
      },
      connections: connections,
    );
  }

  int _generateToothId(int id) {
    return switch (id) {
      < 8 => 8 - id + 10,
      < 16 => id - 8 + 1 + 20,
      < 24 => 24 - id + 30,
      < 32 => id - 24 + 1 + 40,
      _ => id,
    };
  }

  (int, int) _generateConnectionIds(int id) {
    return switch (id) {
      < 107 => (18 - (id - 100), 17 - (id - 100)),
      == 107 => (11, 21),
      <= 114 => (21 + (id - 108), 22 + (id - 108)),
      < 122 => (37 - (id - 115), 38 - (id - 115)),
      == 122 => (31, 41),
      < 130 => (41 + (id - 123), 42 + (id - 123)),
      _ => (id, id),
    };
  }
}

class _ToothWidget extends StatelessWidget {
  final Tooth tooth;
  final ToothStyle? style;

  const _ToothWidget({
    required this.tooth,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = style != null;
    final color = isSelected ? style!.color : Colors.white;

    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: color,
            shadows: isSelected
                ? [const BoxShadow(blurRadius: 4, offset: Offset(0, 6))]
                : null,
            shape: ToothBorder(tooth.path),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Text(
              '${tooth.id}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ConnectionWidget extends StatelessWidget {
  final ToothConnection connection;
  final bool isSelected;

  const _ConnectionWidget({
    required this.connection,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: isSelected ? Colors.teal.shade400 : Colors.white,
        shadows: isSelected
            ? [const BoxShadow(blurRadius: 4, offset: Offset(0, 6))]
            : null,
        shape: ToothBorder(connection.path),
      ),
    );
  }
}

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
}

class Tooth {
  final int id;
  final Path path;
  final Rect rect;

  Tooth({
    required this.id,
    required Path path,
  })  : path = path,
        rect = path.getBounds();
}

class ToothConnection {
  final int id;
  final int tooth1Id;
  final int tooth2Id;
  final Path path;
  final Rect rect;

  ToothConnection({
    required this.id,
    required this.tooth1Id,
    required this.tooth2Id,
    required Path path,
  })  : path = path,
        rect = path.getBounds();
}

class ToothStyle {
  final Color color;
  final String treatment;
  final String material;

  const ToothStyle({
    required this.color,
    required this.treatment,
    required this.material,
  });
}

class ToothBorder extends ShapeBorder {
  final Path path;

  const ToothBorder(this.path);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => path;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return rect.topLeft == Offset.zero ? path : path.shift(rect.topLeft);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black54;
    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) => this;
}
