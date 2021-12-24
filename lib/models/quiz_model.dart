class QuizModel {
  final String quizId;
  final String quizName;
  final String quizLink;

  QuizModel({required this.quizId,
    required this.quizName,
    required this.quizLink,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      quizId: json['id'],
      quizName: json['quiztitle'],
      quizLink: json['quizurl'],
    );
  }
}