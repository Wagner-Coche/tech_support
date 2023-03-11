import 'get_image_service.dart';
import 'package:image_picker/image_picker.dart';

class GetImageServiceImp implements GetImageService {
  ImagePicker imagePicker = ImagePicker();

  @override
  Future<XFile?> getImage() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }
}