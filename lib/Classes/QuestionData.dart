import 'Question.dart';

class QuestionData {
  int _questionNumber = 0;

  List<Question> questions = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: true),
    Question(
        question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answer: true),
    Question(
        question: 'It is illegal to pee in the Ocean in Portugal.',
        answer: true),
  ];

  void getNextQuestion() {
    if (_questionNumber < questions.length - 1) {
      _questionNumber = _questionNumber + 1;
    }
  }

  void resetIndex() {
    _questionNumber = 0;
  }

  bool checkCompleteness() {
    return _questionNumber == questions.length - 1;
  }

  String getQuestion() {
    if (_questionNumber >= 0 && _questionNumber < questions.length) {
      return questions[_questionNumber].question;
    }
    return "";
  }

  void AddQuestion(Question question) {
    questions.add(question);
  }

  bool getAnswer() {
    if (_questionNumber >= 0 && _questionNumber < questions.length) {
      return questions[_questionNumber].answer;
    }
    return false;
  }
}
