import 'package:flutter/material.dart';
import 'backend.dart' as backend;

class QuestionCard extends StatefulWidget {
  QuestionCard({
    Key key,
    this.textColor,
    this.cardBackgroundColor,
  }) : super(key: key);

  final Color textColor;
  final Color cardBackgroundColor;

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
          color: widget.cardBackgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: widget.cardBackgroundColor)),
        ),
        child: FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 1.0,
          child: Center(
            child: Padding(
                padding: EdgeInsets.all(35),
                child: FutureBuilder<backend.GetQuestion>(
                  future: futureGetQuestion,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.question,
                        style:
                            TextStyle(color: widget.textColor, fontSize: 40.0),
                      );
                    } else if (snapshot.hasError) {
                      return Text(
                        snapshot.error.toString(),
                        style:
                            TextStyle(color: widget.textColor, fontSize: 40.0),
                      );
                    }
                    return Text(
                      "nothing loaded yet",
                      style: TextStyle(color: widget.textColor, fontSize: 40.0),
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
