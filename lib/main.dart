import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: ListView(
        children: [
          _image == null
              ? Container()
              : GestureDetector(
                  child: Image.file(_image),
                  onTap: () {
                    Fluttertoast.showToast(
                        msg:
                            'You just unintentionally pressed the underlying GestureDetector!');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Scaffold(
                            appBar: AppBar(
                              title:
                                  Text("Shouldnt've come here 'automatically'"),
                            ),
                            body: Text(
                                'came here after double clicking the "take photo" button of the native screen (image_picker)'))));
                  },
                ),
          TextButton(
            child: Text('click here'),
            onPressed: getImage,
          ),
        ],
      ),
    );
  }
}
