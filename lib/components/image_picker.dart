import 'dart:io'; // Required for File class (though we'll use bytes more directly)
import 'dart:typed_data'; // Required for Uint8List

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tlbisibida_doc/constants/constants.dart'; // Required for ImagePicker

// The 'images' list now expects Uint8List, representing the raw bytes of the images.
Widget imagePicker(List<Uint8List> images, bool show_cam) {
  // StatefulBuilder is used here to manage the state of the image list
  // within this stateless widget.
  return StatefulBuilder(
    builder: (context, setState) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: show_cam ? 150 : 50, // Adjust width based on show_cam flag
            child: show_cam
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Gallery picker button for multiple images
                      CircleAvatar(
                        backgroundColor: cyan200,
                        child: IconButton(
                          onPressed: () async {
                            // Pick an image from the gallery
                            final pickedFile = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (pickedFile != null) {
                              // Read the bytes from the picked file
                              final bytes = await pickedFile.readAsBytes();
                              // Update the state to add the new image bytes to the list
                              setState(() {
                                images.add(bytes);
                              });
                            }
                          },
                          icon: const Icon(Icons.image_search_rounded),
                          color: cyan500,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // Camera picker button for multiple images
                      CircleAvatar(
                        backgroundColor: cyan200,
                        child: IconButton(
                          onPressed: () async {
                            // Pick an image from the camera
                            final pickedFile = await ImagePicker()
                                .pickImage(source: ImageSource.camera);
                            if (pickedFile != null) {
                              // Read the bytes from the picked file
                              final bytes = await pickedFile.readAsBytes();
                              // Update the state to add the new image bytes to the list
                              setState(() {
                                images.add(bytes);
                              });
                            }
                          },
                          icon: const Icon(Icons.camera_alt_rounded),
                          color: cyan500,
                        ),
                      )
                    ],
                  )
                : CircleAvatar(
                    backgroundColor: cyan200,
                    child: IconButton(
                      onPressed: () async {
                        // Pick an image from the gallery (single image mode)
                        final pickedFile = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (pickedFile != null) {
                          // Read the bytes from the picked file
                          final bytes = await pickedFile.readAsBytes();
                          // Update the state to replace the existing image(s) with the new one
                          setState(() {
                            // Clear the list to ensure only one image is present
                            images.clear();
                            // Add the newly picked image bytes
                            images.add(bytes);
                          });
                        }
                      },
                      icon: const Icon(Icons.image_search_rounded),
                      color: cyan500,
                    ),
                  ),
          ),
          // Display selected images in a horizontal scrollable list
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: images.map((imageBytes) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    clipBehavior:
                        Clip.antiAlias, // Clip content to rounded corners
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.memory(
                      imageBytes, // Display the image from its raw bytes
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover, // Cover the container area
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    },
  );
}
