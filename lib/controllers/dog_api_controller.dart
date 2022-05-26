import 'package:get/get.dart';

class DogController extends GetxController {
  static DogController instance = Get.find();

  var activeBreed = ''.obs;

  void changeActiveBreed(String breed) {
    activeBreed.value = breed;
  }
}
