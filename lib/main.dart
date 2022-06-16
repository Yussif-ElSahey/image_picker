import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(k());
}

class k extends StatefulWidget {
  @override
  _kState createState() => _kState();
}

class _kState extends State<k> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? file;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
        backgroundColor: Color.fromARGB(255, 18, 103, 145),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              color: Colors.black12,
              child: file == null
                  ? Icon(
                      Icons.image_search,
                      size: 50,
                    )
                  : Image.file(
                      file!,
                      fit: BoxFit.fill,
                    ),
            ),
            MaterialButton(
              onPressed: () {
                getgall();
              },
              color: Color.fromARGB(255, 18, 103, 145),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Take From Gallery",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                getcam();
              },
              color: Color.fromARGB(255, 18, 103, 145),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Take From Camera",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getcam() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgall() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}
