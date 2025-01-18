import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';

class ImageProviderModel with ChangeNotifier {
  File? _pickedImage;

  File? get pickedImage => _pickedImage;

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      _pickedImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  void clearImage() {
    _pickedImage = null;
    notifyListeners();
  }
}
