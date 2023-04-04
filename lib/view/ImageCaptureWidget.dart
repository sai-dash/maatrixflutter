/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageCaptureWidget extends StatefulWidget {
  @override
  _ImageCaptureWidgetState createState() => _ImageCaptureWidgetState();
}

class _ImageCaptureWidgetState extends State<ImageCaptureWidget> {
  File _imageFile;

  Future<void> _captureImage() async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = '${DateTime.now()}.png';
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    setState(() {
      _imageFile = savedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_imageFile != null)
          Image.file(
            _imageFile,
            width: 200,
            height: 200,
          ),
        ElevatedButton(
          onPressed: _captureImage,
          child: Text('Capture Image'),
        ),
      ],
    );
  }
}
*/
