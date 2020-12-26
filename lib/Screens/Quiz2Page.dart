import 'package:cetquiz_app/Screens/ResultPage.dart';
import 'package:cetquiz_app/Service/Question.dart';
import 'package:cetquiz_app/Service/Quiz2Manager.dart';
import 'package:flutter/material.dart';

class Quiz2Page extends StatefulWidget {
  @override
  _Quiz2PageState createState() => _Quiz2PageState();
}

class _Quiz2PageState extends State<Quiz2Page> {
  Quiz2Manager _manager = Quiz2Manager();
  List<Widget> getOptions(Question question) {
    List<Widget> optionButtons = [];
    for (int i = 0; i < question.options.length; i++) {
      optionButtons.add(
        FlatButton(
          onPressed: () {
            _manager
                .nextQuestion(_manager.getCurrentQuestion().options[i].score);
            if (_manager.isFinished()) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResultPage(
                        score: _manager.getTotalScore(),
                      )));
            }
            setState(() {});
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(25)),
            child: Text(
              '${_manager.getCurrentQuestion().options[i].text}',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
    return optionButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question ${_manager.getCurrentId()}/${_manager.totalQuestionNumber()}',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '${_manager.getCurrentQuestion().text}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: getOptions(_manager.getCurrentQuestion())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
