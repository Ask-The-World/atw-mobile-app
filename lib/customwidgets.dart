import 'package:flutter/material.dart';
import 'backend.dart' as backend;

class QuestionCard extends StatefulWidget {
  QuestionCard({Key key}) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  Future<backend.GetQuestion> futureGetQuestion;

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  void getQuestions() {
    futureGetQuestion = backend.fetchGetQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          getQuestions();
          print("reloaded");
        });
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Color(0xFF3f80a0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Color(0xFF3f80a0))),
        ),
        child: Padding(
            padding: EdgeInsets.all(50),
            child: FutureBuilder<backend.GetQuestion>(
              future: futureGetQuestion,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.question);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Text("nothing loaded yet");
              },
            )),
      ),
    );
  }
}
