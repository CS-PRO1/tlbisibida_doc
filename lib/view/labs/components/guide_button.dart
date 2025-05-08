import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart'; // Assuming this import is correct
import 'package:tlbisibida_doc/view/labs/components/vita_shade_guide.dart';

// A button widget that allows selecting a VITA shade from a modal sheet.
class ShadeSelectionButton extends StatefulWidget {
  const ShadeSelectionButton({Key? key}) : super(key: key);

  @override
  _ShadeSelectionButtonState createState() => _ShadeSelectionButtonState();
}

class _ShadeSelectionButtonState extends State<ShadeSelectionButton> {
  // The currently selected shade name to display on the button.
  String? _selectedShadeName;
  // The color of the currently selected shade to use for the button's background.
  Color? _selectedShadeColor;

  // Function to show the VITA Shade Guide in a bottom modal sheet.
  void _showShadeGuideSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to take up more height
      builder: (BuildContext context) {
        return Container(
          // Add some padding or margin if needed
          padding: const EdgeInsets.all(16.0),
          // Use the VitaShadeGuide widget in the modal sheet
          child: VitaShadeGuide(
            onShadeSelected: (shadeName, shadeColor) {
              // Update the state of the button when a shade is selected.
              setState(() {
                _selectedShadeName = shadeName;
                _selectedShadeColor = shadeColor;
              });
              // Close the modal sheet after selection.
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Assuming cyan600 is defined in your constants.dart
    // If not, you'll need to define it or replace it with an actual Color value.
    // Example placeholder color if not defined in constants.dart
    // const Color cyan600 = Color(0xFF00ACC1);

    return ElevatedButton(
      // Using ElevatedButton for a more prominent button
      onPressed: _showShadeGuideSheet, // Show the modal sheet when pressed
      style: ElevatedButton.styleFrom(
        // Set the button's background color based on the selected shade.
        backgroundColor: _selectedShadeColor ??
            Colors.blueGrey, // Default color if no shade is selected
        // Determine text color for contrast based on the button's background color
        foregroundColor: _selectedShadeColor != null &&
                _selectedShadeColor!.computeLuminance() > 0.5
            ? Colors.black87
            : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: Text(
        _selectedShadeName ??
            'Select Shade', // Display selected shade name or default text
      ),
    );
  }
}
