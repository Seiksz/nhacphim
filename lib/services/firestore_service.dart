import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getMovies() {
    return _firestore.collection('movies').snapshots();
  }

  Stream<QuerySnapshot> getMusics() {
    return _firestore.collection('musics').snapshots();
  }
}