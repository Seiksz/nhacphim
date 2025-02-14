import 'package:flutter/material.dart';
import '../models/music_model.dart';

class MusicPlayerScreen extends StatelessWidget {
  final Music music;

  MusicPlayerScreen({required this.music});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(music.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(music.imageUrl),
            SizedBox(height: 16),
            Text(music.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(music.artist, style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            IconButton(
              icon: Icon(Icons.play_circle_filled, size: 64),
              onPressed: () {
                // Implement music playback logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}