import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final imagePicker = ImagePicker();
  Future<File> pickImage({required ImageSource source}) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    return File(pickedFile!.path);
  }
}
