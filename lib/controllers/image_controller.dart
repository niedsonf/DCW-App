import 'package:get/get.dart';
import 'package:getmage/widgets/image_builder.dart';

class ImageController extends GetxController {
  static ImageController instance = Get.find();

  var activeImage = ImageBuilder().obs;
  var activeURL = ''.obs;

  changeImage(String url) {
    activeImage.value = ImageBuilder();
    activeURL.value = url;
  }
}
