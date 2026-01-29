class TodoEntity {
  int id;
  String title;

  TodoEntity({required this.id, required this.title});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
