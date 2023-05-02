class Post {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  Post({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'completed': completed,
      };
}
