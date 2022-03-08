import 'dart:convert';
import 'package:galleryapp/models/photos.dart';
import 'package:http/http.dart' as http;
class RemoteServices {
  static Future<List<Photos>> fetchPhotos() async {
    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      var photoList = jsonDecode(response.body) as List;
      List<Photos> photos =
      photoList.map((tagJson) => Photos.fromJson(tagJson)).toList();
      print(photos.length);
      return photos;
    } else {
      return null;
    }
  }
}
