import 'package:flutter/material.dart';
import 'package:galleryapp/controller/photo_controller.dart';
import 'package:galleryapp/image_tile.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PhotoController photoController = Get.put(PhotoController());

  @override
  void initState() {
    photoController.loading = true;
    photoController.fetchPhotos();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   ImageTile(photoController.photosList[RangeError.range(invalidValue, minValue, maxValue)]);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Photo Feed",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800),
              ),
            ),
            GetBuilder(
              builder: (PhotoController controller) {
                return (controller.loading)
                    ? Container()
                    : Expanded(
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.photosList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: ImageTile(
                                      photoController.photosList[index]));
                            }),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
