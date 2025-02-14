import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  MovieItem({required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(movie.imageUrl),
      title: Text(movie.title),
      subtitle: Text(movie.description),
      onTap: onTap,
    );
  }
}