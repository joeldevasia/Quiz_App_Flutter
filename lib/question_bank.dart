import 'Questions.dart';
import 'main.dart';

class QuestionBank {

  int _qNo = 0;
  final List<Questions> _questions = [
    Questions(
      question: 'Vitamin C is also known by the chemical name of Ascorbic Acid',
      answer: true,
    ),
    Questions(
      question: 'The liver is the largest organ in the human body',
      answer: false,
    ),
    Questions(
      question:
          'There is no way of telling boiled eggs from raw eggs until you break them open',
      answer: false,
    ),
    Questions(
      question: 'Mount Fuji is the highest mountain in Japan',
      answer: true,
    ),
    Questions(
      question:
          'There are over 30,000 varieties of apples existing in the world',
      answer: true,
    ),
  ];

  nextQuestion(){
    if(_qNo < _questions.length -1){
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

  void reset(){
    _qNo = 0;
  }
}
