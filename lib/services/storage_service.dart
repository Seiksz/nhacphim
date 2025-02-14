import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> getImageUrl(String path) async {
    return await _storage.ref(path).getDownloadURL();
  }
}