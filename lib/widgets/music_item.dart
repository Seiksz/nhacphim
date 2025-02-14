import 'package:flutter/material.dart';
import '../models/music_model.dart';

class MusicItem extends StatelessWidget {
  final Music music;
  final VoidCallback onTap;

  MusicItem({required this.music, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(music.imageUrl),
      title: Text(music.title),
      subtitle: Text(music.artist),
      onTap: onTap,
    );
  }
}