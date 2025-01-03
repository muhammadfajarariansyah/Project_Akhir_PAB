class Task {
  String subject;
  String taskName;
  DateTime dueDate;
  String attachment;
  bool isFavorite;

  Task({
    required this.subject,
    required this.taskName,
    required this.dueDate,
    required this.attachment,
    this.isFavorite = false,
  });

  // TODO: Serialize task ke JSON
  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'taskName': taskName,
      'dueDate': dueDate.toIso8601String(),
      'attachment': attachment,
      'isFavorite': isFavorite,
    };
  }

  // TODO: Deserialize task dari JSON
  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      subject: json['subject'],
      taskName: json['taskName'],
      dueDate: DateTime.parse(json['dueDate']),
      attachment: json['attachment'],
      isFavorite: json['isFavorite'],
    );
  }
}
