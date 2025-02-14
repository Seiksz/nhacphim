class Music {
  final String id;
  final String title;
  final String artist;
  final String imageUrl;

  Music({required this.id, required this.title, required this.artist, required this.imageUrl});

  factory Music.fromMap(Map<String, dynamic> data) {
    return Music(
      id: data['id'],
      title: data['title'],
      artist: data['artist'],
      imageUrl: data['imageUrl'],
    );
  }
}