// teeth_cubit.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:tlbisibida_doc/services/BloC/States/teeth_state.dart';
import 'package:xml/xml.dart';


typedef Data = ({
  Size size,
  Map<int, Tooth> teeth,
  Map<int, ToothConnection> connections
});

class TeethCubit extends Cubit<TeethState> {
  TeethCubit() : super(TeethInitial());

  Data _data = (size: Size.zero, teeth: {}, connections: {});

  Future<void> loadTeeth(String asset) async {
    emit(TeethLoading());
    try {
      _data = await _loadTeethData(asset);
      emit(TeethLoaded(_data));
    } catch (e) {
      emit(TeethError(e.toString()));
    }
  }

  Set<Tooth> getSelectedTeeth() {
    return _data.teeth.values.where((tooth) => tooth.selected).toSet();
  }

  Set<ToothConnection> getSelectedConnections() {
    return _data.connections.values
        .where((connection) => connection.selected)
        .toSet();
  }

  bool canEstablishConnection(ToothConnection connection) {
    final tooth1 = _data.teeth.values
        .firstWhere((tooth) => tooth.id == connection.tooth1Id);
    final tooth2 = _data.teeth.values
        .firstWhere((tooth) => tooth.id == connection.tooth2Id);
    return tooth1.selected &&
        tooth2.selected &&
        tooth1.material == tooth2.material;
  }

  void toggleToothSelection(Tooth tooth) {
    tooth.selected = !tooth.selected;
    emit(TeethLoaded(_data));
  }

  void setToothTreatment(Tooth tooth, String treatment) {
    tooth.treatment = treatment;
    emit(TeethLoaded(_data));
  }

  void setToothMaterial(Tooth tooth, String material) {
    tooth.material = material;
    emit(TeethLoaded(_data));
  }

  void toggleConnectionSelection(ToothConnection connection) {
    if (canEstablishConnection(connection)) {
      connection.selected = !connection.selected;
      emit(TeethLoaded(_data));
    }
  }

  void clearTooth(Tooth tooth) {
    tooth.selected = false;
    tooth.treatment = null;
    tooth.material = null;
    for (final connection in _data.connections.values) {
      if (connection.tooth1Id == tooth.id || connection.tooth2Id == tooth.id) {
        connection.selected = false;
      }
    }
    emit(TeethLoaded(_data));
  }

  Future<Data> _loadTeethData(String asset) async {
    final xml = await rootBundle.loadString(asset);
    final doc = XmlDocument.parse(xml);
    final viewBox = doc.rootElement.getAttribute('viewBox')!.split(' ');
    final w = double.parse(viewBox[2]);
    final h = double.parse(viewBox[3]);

    final teeth = doc.rootElement.findAllElements('path');
    final connections = <int, ToothConnection>{};

    for (final tooth in teeth) {
      final id = int.parse(tooth.getAttribute('id')!);
      if (id >= 100) {
        connections[id] = ToothConnection(
          id,
          _generateConnectionIds(id).$1,
          _generateConnectionIds(id).$2,
          Rect.fromLTWH(0, 0, 50, 50),
          parseSvgPathData(tooth.getAttribute('d')!),
        );
      }
    }

    return (
      size: Size(w, h),
      teeth: <int, Tooth>{
        for (final tooth in teeth)
          if (int.parse(tooth.getAttribute('id')!) < 100)
            int.parse(tooth.getAttribute('id')!): Tooth(
              _generateToothId(int.parse(tooth.getAttribute('id')!)),
              parseSvgPathData(tooth.getAttribute('d')!),
            ),
      },
      connections: connections,
    );
  }

  int _generateToothId(int id) {
    int number = switch (id) {
      < 8 => 8 - id + 10,
      < 16 => id - 8 + 1 + 20,
      < 24 => 24 - id + 30,
      < 32 => id - 24 + 1 + 40,
      _ => id
    };
    return number;
  }

  (int, int) _generateConnectionIds(int id) {
    int id1 = switch (id) {
      < 107 => (18 - (id - 100)),
      == 107 => 11,
      <= 114 => (21 + (id - 108)),
      < 122 => (37 - (id - 115)),
      == 122 => 31,
      < 130 => (41 + (id - 123)),
      _ => id,
    };
    int id2 = switch (id) {
      < 107 => (17 - (id - 100)),
      == 107 => 21,
      <= 114 => (22 + (id - 108)),
      < 122 => (38 - (id - 115)),
      == 122 => 41,
      < 130 => (42 + (id - 123)),
      _ => id,
    };
    return (id1, id2);
  }
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
      case 'Crown':
        return Colors.cyan.shade400;
      case 'Pontic':
        return Colors.pink.shade400;
      case 'Implant':
        return Colors.green.shade400;
      case 'Veneer':
        return Colors.orange.shade400;
      case 'Inlay':
        return Colors.purple.shade400;
      case 'Denture':
        return Colors.red.shade400;
      default:
        return Colors.white;
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
      ..strokeWidth = 2
      ..color = Colors.black54;
    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) => this;
}