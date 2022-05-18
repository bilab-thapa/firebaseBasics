import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider {
  Future<void> userLogin() async {}

  Future<void> userSignUp({
    required String username,
    required String email,
    required String password,
    required XFile image,
  }) async {
    final imageId = DateTime.now().toIso8601String();
    final ref = FirebaseStorage.instance.ref().child('userImage/$imageId');
    final imageFile = File(image.path);
    await ref.putFile(imageFile);
    final imageUrl = await ref.getDownloadURL();
  }
}
