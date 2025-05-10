import 'package:flutter/material.dart';

// Placeholder widget for the VITA 3D Master Shade Guide.
// This widget simulates the behavior needed for integration into the
// ShadeSelectionButton's modal sheet.
class Vita3DMasterGuide extends StatefulWidget {
  // Callback function that is called when a shade is selected.
  // Returns both the shade name (String) and the shade color (Color).
  final Function(String shadeName, Color shadeColor)? onShadeSelected;

  // Optional initial selected shade name.
  final String? initialSelectedShade;

  const Vita3DMasterGuide({
    Key? key,
    this.onShadeSelected,
    this.initialSelectedShade,
  }) : super(key: key);

  @override
  _Vita3DMasterGuideState createState() => _Vita3DMasterGuideState();
}

class _Vita3DMasterGuideState extends State<Vita3DMasterGuide> {
  // Placeholder shades and colors for demonstration.
  final Map<String, Color> _shades = {
    '0M1': Colors.grey[200]!,
    '0M2': Colors.grey[300]!,
    '0M3': Colors.grey[400]!,
    '1M1': Colors.yellow[100]!,
    '1M2': Colors.yellow[200]!,
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
