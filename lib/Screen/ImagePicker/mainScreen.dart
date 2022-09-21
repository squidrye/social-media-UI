import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

import 'package:social_media_demo/Screen/ImagePicker/widget/filtered_image_widget.dart';
import 'package:social_media_demo/Screen/ImagePicker/widget/filtered_image_list_widget.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/preset_filters.dart';

import './filterUtils.dart';


class MainScreen extends StatefulWidget {
  static String routeName = "./mainScreenImagePicker";
 final String title;
  MainScreen({Key? key,required this.title}) : super(key: key);


  @override
  _MainScreenState createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {

  img.Image? image;
  Filter filter = presetFiltersList.first;

   void initState(){
    super.initState();
    pickImage();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height:500,
      child: ListView(
        children: [
          buildImage(),
          const SizedBox(height: 12),
          buildFilters(),
        ],
      ),
    );
  }

  Future pickImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    final imageBytes = File(image!.path).readAsBytesSync();

    final newImage = img.decodeImage(imageBytes);
    FilterUtils.clearCache();

    setState(() {
      this.image = newImage;
    });
  }

  Widget buildImage() {
    const double height = 450;
    if (image == null) return Container();

    return FilteredImageWidget(
      filter: filter,
      image: image!,
      successBuilder: (imageBytes) =>
          Image.memory( Uint8List.fromList(imageBytes), height: height, fit: BoxFit.fitHeight),
      errorBuilder: () => Container(height: height),
      loadingBuilder: () => Container(
        height: height,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget buildFilters() {
    if (image == null) return Container();

    return FilteredImageListWidget(
      filters: presetFiltersList,
      image: image!,
      onChangedFilter: (filter) {
        setState(() {
          this.filter = filter;
        });
      },
    );
  }
}