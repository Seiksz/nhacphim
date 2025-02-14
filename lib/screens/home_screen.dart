import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'movie_detail_screen.dart';
import 'music_player_screen.dart';
import '../models/movie_model.dart';
import '../models/music_model.dart';
import '../widgets/movie_item.dart';
import '../widgets/music_item.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('movies').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final movies = snapshot.data!.docs
                    .map((doc) => Movie.fromMap(doc.data() as Map<String, dynamic>))
                    .toList();
                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MovieItem(
                      movie: movies[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailScreen(movie: movies[index]),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('musics').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final musics = snapshot.data!.docs
                    .map((doc) => Music.fromMap(doc.data() as Map<String, dynamic>))
                    .toList();
                return ListView.builder(
                  itemCount: musics.length,
                  itemBuilder: (context, index) {
                    return MusicItem(
                      music: musics[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MusicPlayerScreen(music: musics[index]),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   final FirestoreService _firestoreService = FirestoreService();
//   final StorageService _storageService = StorageService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             // Tải file lên Firebase Storage
//             final imageUrl = await _storageService.uploadFile(File('path/to/image.jpg'), 'movies/images/inception.jpg');
//
//             // Thêm phim vào Firestore
//             await _firestoreService.addMovie(
//               title: 'Inception',
//               description: 'A thief who steals corporate secrets...',
//               imageUrl: imageUrl,
//               videoUrl: 'https://firebasestorage.googleapis.com/.../inception.mp4',
//             );
//           },
//           child: Text('Add Movie'),
//         ),
//       ),
//     );
//   }
// }