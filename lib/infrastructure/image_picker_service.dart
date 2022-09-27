import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final imagePickerServiceProvider = Provider((ref) => ImagePickerService());

class ImagePickerService {
  final imagePicker = ImagePicker();
  Future<File> pickImage({required ImageSource source}) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    return File(pickedFile!.path);
  }
}
