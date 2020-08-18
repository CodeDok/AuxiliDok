import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final Function imagePickFn;

  UserImagePicker(this.imagePickFn);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  final picker = ImagePicker();
  File _pickedPrevImage;

  void _pickImage() async{
    final pickedImage = await picker.getImage(source: ImageSource.gallery, imageQuality: 50, maxWidth: 150);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickedPrevImage = pickedImageFile;
    });
    widget.imagePickFn(_pickedPrevImage);
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipOval(
          child: _pickedPrevImage != null ? 
          new Image.file(
            _pickedPrevImage, 
            fit: BoxFit.cover,
            width: 70,
            height: 70,
          ) 
          : new Image.network(
            'https://firebasestorage.googleapis.com/v0/b/auxilidok.appspot.com/o/user_image%2Fdefault_profile_image.png.png?alt=media&token=0ed23918-8380-47c7-b10b-c83e6085561d',
            fit: BoxFit.cover,
            width: 70,
            height: 70,
            ),
        ),
        FlatButton.icon(
          onPressed: _pickImage,
          textColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        ),
      ],
    );
  }
}