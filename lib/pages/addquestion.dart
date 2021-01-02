import 'dart:math';

import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key key}) : super(key: key);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  String question = "empty...";
  double time = 60;
  double minTime = 20;
  double maxTime = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Container(), flex: 1),
                    Expanded(
                      flex: 8,
                      child: Text(
                        "Add Question",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontSize: 40.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          flex: 4,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 0.0, 5.0, 5.0),
                              child: TextField(
                                keyboardType: TextInputType.url,
                                maxLines: 1,
                                cursorColor:
                                    Theme.of(context).textTheme.bodyText1.color,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Question",
                                  labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Theme.of(context).cardColor,
                                    width: 2.0,
                                  )),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Theme.of(context).cardColor,
                                    width: 2.0,
                                  )),
                                  hintStyle: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                  ),
                                  hintText: "Enter here...",
                                ),
                                onChanged: (text) {
                                  question = text;
                                },
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 10.0,
                      ),
                    ]),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          "Time:",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Slider(
                        value: time,
                        min: minTime,
                        max: maxTime,
                        divisions: (maxTime - minTime).toInt(),
                        label: time.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            time = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [Container()],
                ),
              )
            ],
          ),
        ));
  }
}
