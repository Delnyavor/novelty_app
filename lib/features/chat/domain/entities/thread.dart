class Thread {
  final int id;
  final String title;
  final String cover;
  final String message;

  const Thread({
    required this.id,
    required this.title,
    required this.cover,
    required this.message,
  });

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ cover.hashCode ^ message.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Thread &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          message == other.message &&
          id == other.id;

  @override
  String toString() {
    return '''Thread{
        id: $id,
        title: $title,
        cover: $cover,
        message: $message,
      }''';
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title': title,
      'cover': cover,
      'message': message,
    };
  }

  static Thread fromJson(Map<String, dynamic> json) {
    return Thread(
      id: json['id'] as int,
      title: json['title'] as String,
      cover: json['cover'] as String,
      message: json['message'],
    );
  }
}
