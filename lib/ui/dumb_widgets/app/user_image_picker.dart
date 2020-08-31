import 'dart:io';
import 'dart:math' as math;

import 'package:auxilidok/app/constants.dart' as constants;
import 'package:auxilidok/services/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/locator.dart';

class UserImagePicker extends StatefulWidget {
  final Function imagePickFn;

  UserImagePicker(this.imagePickFn);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  final ImagePickerService _imagePicker = locator<ImagePickerService>();
  File _pickedPrevImage;

  void _pickImage() async{
    _pickedPrevImage = await _imagePicker.pickImage(type: ImageSource.gallery, imageQuality: 80, maxWidth: 150);
    setState(() {
      _pickedPrevImage = _pickedPrevImage;
    });
    widget.imagePickFn(_pickedPrevImage);
  }
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Stack(
          children: [
            ClipRRect(
              child: Container(
                margin: EdgeInsets.only(top: 70),
                child: Transform.rotate(
                  angle: 45 * math.pi/180,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(color: constants.start_customChromeYellow_p25)
                    ),
                    padding: EdgeInsets.all(35),
                    height: 200,
                    width: 200,
                    child: Transform.rotate(
                      angle: -45 * math.pi/180,
                      child: Card(
                        elevation: 0,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(
                           Radius.circular(10)
                          )
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: _pickedPrevImage != null ? Image(
                            fit: BoxFit.cover,
                            image: FileImage(_pickedPrevImage),
                          )
                          : Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/default_profile_image.png'),
                          ),
                        )
                      )
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -3,
              right: -10,
              child: IconButton(
                icon: Icon(Icons.settings, color: Colors.white.withOpacity(0.95),),
                iconSize: 48,
                tooltip: 'Add profile picture',
                onPressed: _pickImage,
              ),
            )
          ],
        ),
      ],
    );
  }
}