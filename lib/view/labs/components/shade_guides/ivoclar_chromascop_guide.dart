import 'package:flutter/material.dart';

// Placeholder widget for the Ivoclar Chromascop Shade Guide.
// This widget simulates the behavior needed for integration into the
// ShadeSelectionButton's modal sheet.
class IvoclarChromascopGuide extends StatefulWidget {
  // Callback function that is called when a shade is selected.
  // Returns both the shade name (String) and the shade color (Color).
  final Function(String shadeName, Color shadeColor)? onShadeSelected;

  // Optional initial selected shade name.
  final String? initialSelectedShade;

  const IvoclarChromascopGuide({
    Key? key,
    this.onShadeSelected,
    this.initialSelectedShade,
  }) : super(key: key);

  @override
  _IvoclarChromascopGuideState createState() => _IvoclarChromascopGuideState();
}

class _IvoclarChromascopGuideState extends State<IvoclarChromascopGuide> {
  // Placeholder shades and colors for demonstration.
  final Map<String, Color> _shades = {
    '110': Colors.red[100]!,
    '120': Colors.red[200]!,
    '130': Colors.red[300]!,
    '210': Colors.green[100]!,
    '220': Colors.green[200]!,
    // Add more placeholder shades as needed
  };

  String? _selectedShade;

  @override
  void initState() {
    super.initState();
    _selectedShade = widget.initialSelectedShade;
  }

  void _handleShadeTap(String shadeName) {
    setState(() {
      _selectedShade = shadeName;
    });
    final shadeColor = _shades[shadeName] ?? Colors.grey;
    widget.onShadeSelected?.call(shadeName, shadeColor);
  }

  @override
  Widget build(BuildContext context) {
    // Simplified layout for the placeholder.
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _shades.entries.map((entry) {
          final shadeName = entry.key;
          final shadeColor = entry.value;
          final isSelected = _selectedShade == shadeName;

          return GestureDetector(
            onTap: () => _handleShadeTap(shadeName),
            child: Container(
              width: 60,
              height: 80,
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: shadeColor,
                border: Border.all(
                  color: isSelected ? Colors.blueAccent : Colors.grey,
                  width: isSelected ? 2.0 : 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  shadeName,
                  style: TextStyle(
                    color: shadeColor.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
