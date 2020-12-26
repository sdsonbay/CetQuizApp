import 'package:cetquiz_app/Service/Option.dart';
import 'package:cetquiz_app/Service/Question.dart';

class Quiz2Manager {
  Quiz2Manager() {
    _questions.add(Question('Hangisi 3 büyüklerden değildir?', [
      Option('Trabzonspor', 10),
      Option('Fenerbahçe', 0),
      Option('Galatasaray', 0),
      Option('Beşiktaş', 0),
    ]));

    _questions.add(Question('Hangisi milli takımı çalıştırmamıştır?', [
      Option('Fatih Terim', 0),
      Option('Aykut Kocaman', 10),
      Option('Abdullah Avcı', 0),
      Option('Şenol Güneş', 0),
    ]));

    _questions.add(Question('Hangisi Ankara ekibidir?', [
      Option('Gençlerbirliği', 10),
      Option('Eskişehirspor', 0),
      Option('Akhisarspor', 0),
      Option('Başakşehir', 0),
    ]));

    _questions
        .add(Question('Hangisi yılın futbolcusu ödülünü kazanamamıştır?', [
      Option('Lionel Messi', 0),
      Option('Cristiano Ronaldo', 0),
      Option('Wayne Rooney', 10),
      Option('Ronaldinho', 0),
    ]));

    _questions.add(Question('Hangisinin rengi sarı kırmızı değildir?', [
      Option('Malatyaspor', 0),
      Option('Kayserispor', 0),
      Option('Galatasaray', 0),
      Option('Denizlispor', 10),
    ]));

    _questions.add(Question('Sergen Yalçın hangi takımda forma giymemiştir?', [
      Option('Fenerbahçe', 0),
      Option('Beşiktaş', 0),
      Option('Galatasaray', 0),
      Option('Sivasspor', 10),
    ]));

    _questions.add(Question(
        'İstanbulda oynanan şampiyonlar ligi finali hangi takımlar arasında oynanmıştır?',
        [
          Option('Liverpool - Real Madrid', 0),
          Option('Liverpool - Atletico Madrid', 0),
          Option('Atletico Madrid - Milan', 0),
          Option('Liverpool - Milan', 10),
        ]));

    _questions
        .add(Question('Fatih Terim İtalyada hangi takımı çalıştırmıştır?', [
      Option('Lazio', 0),
      Option('Inter', 0),
      Option('Napoli', 0),
      Option('Fiorentina', 10),
    ]));

    _questions.add(Question('Ajax hangi ülkenin takımıdır?', [
      Option('Makedonya', 0),
      Option('Rusya', 0),
      Option('Almanya', 0),
      Option('Hollanda', 10),
    ]));

    _questions
        .add(Question('Galatasaray UEFA kupasını hangi sene kazanmıltır?', [
      Option('2003', 0),
      Option('2002', 0),
      Option('2001', 0),
      Option('2000', 10),
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
