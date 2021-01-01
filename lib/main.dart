import 'package:flutter/material.dart';
import 'backend.dart' as backend;
import 'customwidgets.dart' as cw;
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        backgroundColor: Color(0xff1a1d33),
        textColor: Color(0xffeefdff),
        cardBackgroundColor: Color(0xff3f80a0),
        yesColor: Color(0xff7fc757),
        noColor: Color(0xffde4630),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {Key key,
      this.backgroundColor,
      this.textColor,
      this.cardBackgroundColor,
      this.yesColor,
      this.noColor})
      : super(
          key: key,
        );

  final Color backgroundColor;
  final Color textColor;
  final Color cardBackgroundColor;
  final Color yesColor;
  final Color noColor;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      side: BorderSide(color: widget.noColor)),
                  color: widget.noColor,
                  onPressed: () {},
                  child: Icon(
                    Icons.clear,
                    color: widget.textColor,
                    size: 80.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Stack(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: widget.cardBackgroundColor)),
                    child: Draggable(
                        feedback: cw.QuestionCard(
                          textColor: widget.textColor,
                          cardBackgroundColor: widget.cardBackgroundColor,
                        ),
                        axis: Axis.vertical,
                        child: cw.QuestionCard()),
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
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: widget.yesColor),
                  ),
                  color: widget.yesColor,
                  onPressed: () {},
                  child: Icon(
                    Icons.done,
                    color: widget.textColor,
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
                        color: widget.textColor, size: 40.0),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.add, color: widget.textColor, size: 50.0),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child:
                        Icon(Icons.info, color: widget.textColor, size: 40.0),
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
