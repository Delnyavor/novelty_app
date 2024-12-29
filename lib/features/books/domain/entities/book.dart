class Book {
  final int id;
  final String title;
  final String author;
  final String isbn;
  final String cover;
  final double rating;
  final String description;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.isbn,
    required this.cover,
    this.rating = 0.0,
    required this.description,
  });

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      author.hashCode ^
      isbn.hashCode ^
      cover.hashCode ^
      description.hashCode ^
      rating.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          author == other.author &&
          isbn == other.isbn &&
          description == other.description &&
          id == other.id;

  @override
  String toString() {
    return '''Book{
        id: $id,
        title: $title,
        author: $author,
        isbn: $isbn,
        cover: $cover,
        rating: $rating,
        description: $description,
      }''';
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'isbn': isbn,
      'cover': cover,
      'rating': rating,
      'description': description,
    };
  }

  static Book fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      // isbn: json['isbn'] as String,
      isbn: '',
      // rating: json['rating'] as double,
      rating: 0.0,
      cover: json['cover_image'],
      description: json['description'],
    );
  }

  // static Book fromJson(Map<String, dynamic> json) {
  //   return Book(
  //     id: json['id'] as int,
  //     title: json['title'] as String,
  //     author: json['author'] as String,
  //     // isbn: json['isbn'] as String,
  //     isbn: '',
  //     cover: json['cover'] as String,
  //     rating: json['rating'] as double,
  //     description: json['description'],
  //   );
  // }
}
