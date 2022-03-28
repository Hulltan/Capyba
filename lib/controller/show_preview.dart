import 'dart:io';
import 'package:get/get.dart';
import '../view/picture_preview.dart';

Future showPreview(picture) async {
  File? pic = await Get.to(() => PreviewPage(picture: picture));

  if (pic != null) {
    picture = pic;
    Get.back();
  }
}
