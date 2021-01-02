import 'package:flutter/material.dart';
import '../server/getquestion.dart' as gq;
import 'addquestion.dart' as aq;

class QuestionCard extends StatefulWidget {
  QuestionCard({
    Key key,
  }) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  Future<gq.GetQuestion> futureGetQuestion;

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  void getQuestions() {
    futureGetQuestion = gq.fetchGetQuestion();
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
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Theme.of(context).cardColor)),
        ),
        child: FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 1.0,
          child: Center(
            child: Padding(
                padding: EdgeInsets.all(35),
                child: FutureBuilder<gq.GetQuestion>(
                  future: futureGetQuestion,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.question,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontSize: 40.0),
                      );
                    } else if (snapshot.hasError) {
                      if (snapshot.error is gq.CustomException) {
                        return Text(
                          snapshot.error.toString(),
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontSize: 40.0),
                        );
                      } else {
                        return Text(
                          "There has been an error connecting to the server :(",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontSize: 40.0),
                        );
                      }
                    }
                    return Text(
                      "nothing loaded yet",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontSize: 40.0),
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 4,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Theme.of(context).errorColor)),
                  color: Theme.of(context).errorColor,
                  onPressed: () {},
                  child: Icon(
                    Icons.clear,
                    color: Theme.of(context).textTheme.bodyText1.color,
                    size: 80.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 13,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Stack(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: Theme.of(context).cardColor)),
                    child: QuestionCard(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Theme.of(context).accentColor),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {},
                  child: Icon(
                    Icons.done,
                    color: Theme.of(context).textTheme.bodyText1.color,
                    size: 80.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.help_outline,
                        color: Theme.of(context).textTheme.bodyText1.color,
                        size: 40.0),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => aq.AddQuestion()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.add,
                        color: Theme.of(context).textTheme.bodyText1.color,
                        size: 50.0),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.info,
                        color: Theme.of(context).textTheme.bodyText1.color,
                        size: 40.0),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
