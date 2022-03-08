import 'package:galleryapp/models/photos.dart';
import 'package:galleryapp/services/remote_services.dart';
import 'package:get/state_manager.dart';

class PhotoController extends GetxController {
  List<Photos> photosList = [];
  bool loading = false;

  void fetchPhotos() async {
    loading = true;
    List<Photos> photos = await RemoteServices.fetchPhotos();
    print('Photos : $photos');
    if (photos != null) {
      photosList = photos;
      loading = false;
    }
    update();
  }
}
