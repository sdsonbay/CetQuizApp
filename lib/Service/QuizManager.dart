import 'package:cetquiz_app/Service/Option.dart';
import 'package:cetquiz_app/Service/Question.dart';

class Quiz2Manager {
  Quiz2Manager() {
    _questions.add(Question('Türkiye' 'nin başkenti neresidir?', [
      Option('Ankara', 10),
      Option('İstanbul', 0),
      Option('İzmir', 0),
      Option('Antalya', 0),
    ]));

    _questions.add(Question('Fransa' 'nın başkenti neresidir?', [
      Option('Lyon', 0),
      Option('Paris', 10),
      Option('Marsilya', 0),
      Option('Dijon', 0),
    ]));

    _questions.add(Question('Almanya' 'nın başkenti neresidir?', [
      Option('Berlin', 10),
      Option('Koln', 0),
      Option('Münih', 0),
      Option('Hamburg', 0),
    ]));

    _questions.add(Question('Çin' 'in başkenti neresidir?', [
      Option('Pekin', 10),
      Option('Vuhan', 0),
      Option('Guangzhou', 0),
      Option('Shangai', 0),
    ]));

    _questions.add(Question('İspanya' 'nın başkenti neresidir?', [
      Option('Madrid', 10),
      Option('Barselona', 0),
      Option('Sevilla', 0),
      Option('Bilbao', 0),
    ]));

    _questions.add(Question('İngiltere' 'nin başkenti neresidir?', [
      Option('Londra', 10),
      Option('Norwich', 0),
      Option('Manchester', 0),
      Option('Swansea', 0),
    ]));

    _questions.add(Question('Güney Kore' 'nin başkenti neresidir?', [
      Option('Seul', 10),
      Option('Busan', 0),
      Option('Suwon', 0),
      Option('Ulsan', 0),
    ]));

    _questions.add(Question('Norveç' 'in başkenti neresidir?', [
      Option('Oslo', 10),
      Option('Bergen', 0),
      Option('Tromso', 0),
      Option('Alesund', 0),
    ]));

    _questions.add(Question('Bulgaristan' 'ın başkenti neresidir?', [
      Option('Sofya', 10),
      Option('Varna', 0),
      Option('Plevne', 0),
      Option('Razgrad', 0),
    ]));

    _questions.add(Question('Yunanistan' 'ın başkenti neresidir?', [
      Option('Atina', 10),
      Option('Selanik', 0),
      Option('Kavala', 0),
      Option('Larissa', 0),
    ]));

    _questions.shuffle();
    for (var question in _questions) {
      question.options.shuffle();
    }
  }
  List<Question> _questions = [];
  int _score = 0;
  int currentQuestionId = 0;
  void nextQuestion(score) {
    if (currentQuestionId < _questions.length) {
      _score += score;
      currentQuestionId++;
    }
  }

  int getTotalScore() => _score;
  int getCurrentId() => currentQuestionId + 1;
  int totalQuestionNumber() => _questions.length;

  bool isFinished() {
    return currentQuestionId >= _questions.length;
  }

  Question getCurrentQuestion() {
    print('getCurrentQuestion $currentQuestionId');
    if (currentQuestionId < _questions.length) {
      return _questions[currentQuestionId];
    } else {
      return Question('', []);
    }
  }
}
