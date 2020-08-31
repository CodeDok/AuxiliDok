import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {

  final ImagePicker _picker = ImagePicker(); 

  Future<File> pickImage({@required ImageSource type, @required int imageQuality, @required double maxWidth}) async{
    final pickedImage = await _picker.getImage(source: type, imageQuality: imageQuality, maxWidth: maxWidth);
    return File(pickedImage.path);
  }

}