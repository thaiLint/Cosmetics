import 'dart:io';
import 'package:get/get.dart';

class UserController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var imageUrl = ''.obs; // network URL
  var imageFile = Rx<File?>(null); // local File if picked

  void updateUser({String? newName, String? newEmail, String? newImageUrl, File? newImageFile}) {
    if (newName != null) name.value = newName;
    if (newEmail != null) email.value = newEmail;
    if (newImageUrl != null) imageUrl.value = newImageUrl;
    if (newImageFile != null) imageFile.value = newImageFile;
  }

  void reset() {
    name.value = '';
    email.value = '';
    imageUrl.value = '';
    imageFile.value = null;
  }
}
