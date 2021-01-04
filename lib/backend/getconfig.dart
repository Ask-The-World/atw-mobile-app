import 'dart:convert';

import 'package:http/http.dart' as http;

class GetQuestion {
  final int minTime;
  final int maxTime;
  final int defaultTime;
  final int maxQuestionLength;
  GetQuestion(
      {this.minTime, this.maxTime, this.defaultTime, this.maxQuestionLength});

  factory GetQuestion.fromJson(Map<String, dynamic> json) {
    return GetQuestion(
      minTime: json["min_time"],
      maxTime: json["max_time"],
      defaultTime: json["default_time"],
      maxQuestionLength: json["max_question_lenght"],
    );
  }
}

class ErrorReturn {
  final String errorMessage;

  ErrorReturn({this.errorMessage});
  factory ErrorReturn.fromJson(Map<String, dynamic> json) {
    return ErrorReturn(errorMessage: json['error']);
  }
}

class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() {
    return message;
  }
}

Future<GetQuestion> fetchGetQuestion() async {
  final response = await http.get('http://192.168.1.105/api/get/config');

  if (response.statusCode == 200) {
    print('Successfull connection (200)');
    return GetQuestion.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 500) {
    print("error connection (500)");
    throw CustomException(
        ErrorReturn.fromJson(jsonDecode(response.body)).errorMessage);
  } else
    print("no connection to anything");
  throw Exception("Could not connect to backend");
}
