import 'question.dart';

class QuizBrain {
  List<Question> _qList = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  int _questionNumber = 0;
  bool _finished = false;
  void nextQuestion() {
    if (_questionNumber < _qList.length - 1)
      _questionNumber++;
    else
      _finished = true;
  }

  void reset() {
    _questionNumber = -1;
    _finished = false;
  }

  bool isFinished() {
    return _finished;
  }

  String getQuestion() {
    return _qList[_questionNumber].question;
  }

  bool getQuestionAns() {
    return _qList[_questionNumber].questionAns;
  }
}
