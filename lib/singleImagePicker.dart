import 'package:flutter/material.dart';
// import 'package:fruitsapp/singleImagePicker.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
 import 'package:fruitsapp/MultiImagePicker.dart';


class singleImagePicker extends StatefulWidget {

  @override
  State<singleImagePicker> createState() => _singleImagePicker();
}

class _singleImagePicker extends State<singleImagePicker> {

  File? image;
  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Single Image Picker'),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    print ("tapping");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MultiImagePicker()) );
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 26.0,
                  ),
                )
            ),
          ]
      ),



    body: Center (
      child: Column(
        children: [
          MaterialButton(
            color: Colors.lightGreenAccent,
              child: Text("Choose Image from Gallery", style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),

              onPressed: (){
                pickImageGallery();
              }
              ),
          MaterialButton(
              color: Colors.lightGreenAccent,
              child: Text("Choose Image from Camera", style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),

              onPressed: (){
               pickImageCamera();
              }
          ),
         SizedBox(height: 40,),
          image != null ?  Stack(
            children: <Widget>[
              Image.file(image!),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: (){
                    print('delete image from List');
                    setState((){
                      print('set new state of images');
                          image = null ;
                    });
                  },
                  child: Icon(
                    Icons.cancel_outlined,
                  ),
                ),
              ),
            ],
          ) : Text("No images choosed")
        ],
      )

    )
    );
  }
}


// body: Center(
// child: Column(
// children: [
// MaterialButton(
// color: Colors.blue,
// child: const Text(
// "Pick Image from Gallery",
// style: TextStyle(
// color: Colors.white70, fontWeight: FontWeight.bold
// )
// ),
// onPressed: () {
// }
// ),
// MaterialButton(
// color: Colors.blue,
// child: const Text(
// "Pick Image from Camera",
// style: TextStyle(
// color: Colors.white70, fontWeight: FontWeight.bold
// )
// ),
// onPressed: () {
// }
// ),
// ],
// ),
// )