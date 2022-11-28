import 'package:flutter/material.dart';
// import 'package:fruitsapp/singleImagePicker.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';


class MultiImagePicker extends StatefulWidget {

  @override
  State<MultiImagePicker> createState() => _MultiImagePicker();
}

class _MultiImagePicker extends State<MultiImagePicker> {

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty){
      imageFileList!.addAll(selectedImages);
    }
    setState(() {

    });

  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Multi Image Picker'),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      print ("tapping");
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
                    color: Colors.grey,
                    child: Text("Choose Images from Gallery", style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),

                    onPressed: (){
                      selectImages();
                      // pickImageGallery();
                    }
                ),
                MaterialButton(
                    color: Colors.grey,
                    child: Text("Choose Images from Camera", style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),

                    onPressed: (){
                      // pickImageCamera();
                      // MultiImagePicker.pickImages(
                      //   maxImages: 300,
                      //   enableCamera: true,
                      //   selectedAssets: images,
                      //   materialOptions: MaterialOptions(
                      //     actionBarTitle: "FlutterCorner.com",
                      //   ),
                      // );
                    }
                ),
                SizedBox(height: 40,),
               // Text("No images choosed"),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                          padding: EdgeInsets.all(10),
                        itemCount: imageFileList!.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3
                          ),
                          itemBuilder: (BuildContext context,int index){
                          // return  Image.file(File(imageFileList![index].path), fit: BoxFit.cover,);
                            return Stack(
                              children: <Widget>[
                            Image.file(File(imageFileList![index].path), fit: BoxFit.cover,),
                                Positioned(
                                  top: 0,
                                  right: 20,
                                  child: GestureDetector(
                                    onTap: (){
                                      print('delete image from List');
                                       setState((){
                                        print('set new state of images${imageFileList[index]}');
                                        imageFileList.removeAt(index);
                                       });
                                    },
                                    child: Icon(
                                      Icons.cancel_outlined,
                                    ),
                                  ),
                                ),
                              ],
                            );






                          }),



                    )

                )
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