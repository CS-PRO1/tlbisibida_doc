import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/view/labs/components/shade_guides/vita_classic_guide.dart'; // Import for ui.Color

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: cyan400,
        child: Center(
          child: ElevatedButton(
            child: Text('Vita Guide'),
            onPressed: () => showModalBottomSheet(
              builder: (context) => VitaShadeGuide(),
              context: context,
            ),
          ),
        ),
      ),
    );
  }
}
