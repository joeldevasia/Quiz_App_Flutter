import 'Questions.dart';

class QuestionBank {
  int _qNo = 0;
  final List<Questions> _questions = [
    Questions(
      ques: 'Vitamin C is also known by the chemical name of Ascorbic Acid',
      ans: true,
    ),
    Questions(
      ques: 'The liver is the largest organ in the human body',
      ans: false,
    ),
    Questions(
      ques:
          'There is no way of telling boiled eggs from raw eggs until you break them open',
      ans: false,
    ),
    Questions(
      ques: 'Mount Fuji is the highest mountain in Japan',
      ans: true,
    ),
    Questions(
      ques: 'There are over 30,000 varieties of apples existing in the world',
      ans: true,
    ),
    Questions(
      ques: 'Peanuts are not nuts!',
      ans: true,
    ),
    Questions(
      ques: 'People may sneeze or cough while sleeping deeply.',
      ans: false,
    ),
    Questions(
      ques: 'Copyrights depreciate over time.',
      ans: true,
    ),
    Questions(
      ques: 'Electrons move faster than the speed of light.',
      ans: false,
    ),
    Questions(
      ques: 'There is no snow on Minecraft',
      ans: false,
    ),
  ];

  nextQuestion() {
    if (_qNo < _questions.length - 1) {
      _qNo++;
    }
  }

  String getQuestion() {
    return _questions[_qNo].ques;
  }

  bool getAnswer() {
    return _questions[_qNo].ans;
  }

  int getLength() {
    return _questions.length;
  }

  void reset() {
    _qNo = 0;
  }
}
