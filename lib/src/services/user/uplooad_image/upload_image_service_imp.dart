import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:e_support/src/services/user/uplooad_image/upload_image_service.dart';

class UploadImageServiceImp implements UploadImageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Future<void> uploadImage({required String path}) async {
    File file = File(path);
    try {
      String reference = "image/img-${DateTime.now().toString()}.jpg";
      await storage.ref(reference).putFile(file);
    } on FirebaseAuthException catch (e) {
      debugPrint("Error: $e");
      throw Exception("Erro no upload: $e");
    }
  }
  
}