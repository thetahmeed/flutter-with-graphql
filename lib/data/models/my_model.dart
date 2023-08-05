/*
{
  "data": {
    "todos": {
      "data": [
        {
          "id": "1",
          "title": "delectus aut autem",
          "completed": false
        },
      ]
    }
  }
}
*/

// This is the json we are getting

class TodoModel {
  TodoModel({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  final String id;
  final String title;
  final bool isCompleted;

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      isCompleted: json['completed'],
    );
  }
}

