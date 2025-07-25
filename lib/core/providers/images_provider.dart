import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider_app1/core/models/my_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImagesProvider extends ChangeNotifier {
  final SharedPreferences? prefs;

  ImagesProvider(this.prefs);

  List<MyImage> images = [];
  List<String> _imagesPaths = [];
  List<int> _selectedImages = [];
  int _imageIndex = 0;
  Timer? _changeImageTimer;

  File? get currentImage => images.isEmpty ? null : images[_imageIndex].file;
  List<int> get selectedImages => _selectedImages;

  void initData() {
    _imagesPaths = prefs!.getStringList('images_list') ?? [];
    for (var element in _imagesPaths) {
      images.add(MyImage(file: File(element)));
    }
    _startChangeImageTimer();
  }

  void _startChangeImageTimer() {
    _changeImageTimer?.cancel();
    final Duration timerDuration = Duration(seconds: 10);
    _changeImageTimer = Timer.periodic(
        timerDuration, (changeImageTimer) => _changeImage(changeImageTimer));
  }

  void _changeImage(Timer changeImageTimer) {
    if (images.isNotEmpty) {
      _imageIndex = (_imageIndex + 1) % images.length;
      notifyListeners();
    }
  }

  void pickImages() async {
    final picker = ImagePicker();
    final newImages = await picker.pickMultiImage();
    if (newImages.isNotEmpty) {
      for (int i = 0; i < newImages.length; i++) {
        //if (!images.contains(newImages[i].path)) {
        _imagesPaths.add(newImages[i].path);
        images.add(MyImage(file: File(newImages[i].path)));
        //}
      }
      prefs!.setStringList('images_list', _imagesPaths);
    }
  }

  void deleteImages(List<MyImage> images) {
    _selectedImages.sort((a, b) => b - a);
    for (int index in _selectedImages) {
      images.removeAt(index);
      _imagesPaths.removeAt(index);
    }
    _selectedImages = [];
    prefs!.remove('images_list');
    prefs!.setStringList('images_list', _imagesPaths);
    _imageIndex = 0;
    notifyListeners();
  }
}
