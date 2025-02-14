class Movie {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  Movie({required this.id, required this.title, required this.description, required this.imageUrl});

  factory Movie.fromMap(Map<String, dynamic> data) {
    return Movie(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      imageUrl: data['imageUrl'],
    );
  }
}