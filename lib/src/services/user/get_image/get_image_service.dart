import 'package:image_picker/image_picker.dart';

abstract class GetImageService {
  Future<XFile?> getImage();
}