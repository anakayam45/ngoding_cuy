class NgodingCuy {
  String? username;
  int status;
  CourseData data;

  NgodingCuy({
    required this.status,
    required this.data,
  });

  factory NgodingCuy.fromJson(Map<String, dynamic> json) => NgodingCuy(
        status: json['status'],
        data: CourseData.fromJson(json['data']),
      );
}

class CourseData {
  List<CourseName> courses;
  List<News> news;

  CourseData({
    required this.courses,
    required this.news,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
        courses: List<CourseName>.from(
            json['courses'].map((x) => CourseName.fromJson(x))),
        news: List<News>.from(json['news'].map((x) => News.fromJson(x))),
      );
}

class CourseName {
  bool selected = false;
  String id;
  String name;
  String image;
  String description;
  String category;
  String duration;
  List<Module> materials;

  CourseName({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.category,
    required this.duration,
    required this.materials,
  });

  factory CourseName.fromJson(Map<dynamic, dynamic> json) {
    return CourseName(
      id: json["id"] ?? "",
      name: json['name'] ?? "",
      image: json['image'] ?? "",
      description: json['description'] ?? "",
      category: json['category'] ?? "",
      duration: json['duration'] ?? "",
      materials: List<Module>.from(
          (json['materials'] ?? []).map((x) => Module.fromJson(x))),
    );
  }
}

class Module {
  bool selected = false;
  bool isdone = false;

  String id;
  String title;
  String description;
  List<ModuleContent> materialContent;
  List<Question> questions;

  Module({
    required this.id,
    required this.title,
    required this.description,
    required this.materialContent,
    required this.questions,
  });

  factory Module.fromJson(Map<dynamic, dynamic> json) {
    return Module(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      materialContent: List<ModuleContent>.from(
          json['material_content'].map((x) => ModuleContent.fromJson(x))),
      questions: List<Question>.from(
          json['questions'].map((x) => Question.fromJson(x))),
    );
  }
}

class ModuleContent {
  String id;
  String content;
  String type;

  ModuleContent({
    required this.id,
    required this.content,
    required this.type,
  });

  factory ModuleContent.fromJson(Map<dynamic, dynamic> json) {
    return ModuleContent(
      id: json['id'] ?? "",
      content: json['content'] ?? "",
      type: json['type'] ?? "text",
    );
  }
}

class Question {
  String id;
  String questionText;
  List<Answer> choices;

  Question({
    required this.id,
    required this.questionText,
    required this.choices,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'],
        questionText: json['question_text'],
        choices:
            List<Answer>.from(json['choices'].map((x) => Answer.fromJson(x))),
      );
}

class Answer {
  String id;
  String text;
  bool isCorrect;

  Answer({
    required this.id,
    required this.text,
    required this.isCorrect,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json['id'],
        text: json['text'],
        isCorrect: json['is_correct'],
      );
}

class News {
  String id;
  String title;
  String description;
  String image;
  DateTime date;
  String type;

  News({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required this.type,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      date:
          json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
      type: json['type']);
}
