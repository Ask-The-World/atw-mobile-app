import 'package:flutter/material.dart';
import 'pages/mainpage.dart' as mp;
import 'package:flutter/services.dart';
import 'backend/getconfig.dart';

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
          accentColor: Color(0xff7fc757), // yesColor
          backgroundColor: Color(0xff1a1d33), // backgroundColor
          cardColor: Color(0xff3f80a0), // cardBackgroundColor
          errorColor: Color(0xffde4630), // noColor
          sliderTheme: SliderThemeData(
            valueIndicatorColor: Color(0xff3f80a0),
            valueIndicatorTextStyle: TextStyle(color: Color(0xffeefdff)),
            showValueIndicator: ShowValueIndicator.always,
            activeTrackColor: Color(0xff3f80a0),
            thumbColor: Color(0xff3f80a0),
          ),
          textTheme: TextTheme(
              bodyText1: TextStyle(color: Color(0xffeefdff)))), // textColor
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key})
      : super(
          key: key,
        );

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GetConfig config;
  @override
  void initState() {
    super.initState();
    config = getConfig();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: mp.MainPage(),
    );
  }
}
