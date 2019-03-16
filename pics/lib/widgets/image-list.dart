import 'package:flutter/material.dart';
import '../models/Image.dart';
import 'imageBox.dart';

class Images extends StatelessWidget {
  final List<ImageModel> imageList;

  Images(this.imageList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: imageList.length,
      itemBuilder: (BuildContext context, int index) {
        return ImageBox(imageList[index].title, imageList[index].url);
      },
    );
  }
}
