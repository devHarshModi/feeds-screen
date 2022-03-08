import 'package:flutter/material.dart';
import 'package:galleryapp/models/photos.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageTile extends StatelessWidget {
  final Photos photo;

  ImageTile(this.photo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 300,
        width: 350,
        child: CachedNetworkImage(
          imageUrl: '${photo.url}',
        ),
      ),
    );
  }
}
