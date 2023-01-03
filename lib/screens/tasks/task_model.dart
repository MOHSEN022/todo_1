class TaskData {
  String id;
  String title;
  String description;
  int date;
  bool isDone;

  TaskData(
      {required this.title,
        required this.date,
        required this.description,
        this.id = "",
        this.isDone = false});

  TaskData.fromJson(Map<String, dynamic> json)
      : this(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      date: json["date"],
      isDone: json["isDone"]);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": date,
      "isDone": isDone,
    };
  }
}
