import 'dart:convert';

import 'package:http/http.dart' as http;

class GetQuestion {
  final String objectId;
  final String question;
  final DateTime time;
  GetQuestion({this.objectId, this.question, this.time});

  factory GetQuestion.fromJson(Map<String, dynamic> json) {
    return GetQuestion(
        objectId: json['_id']['\$oid'],
        question: json['question'],
        time: DateTime.parse(json['time']['\$date']));
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
  final response = await http.get('http://192.168.1.105/api/get/question');

  if (response.statusCode == 200) {
    print('Successfull connection (200)');
    return GetQuestion.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 500) {
    print("error connectio (500)");
    throw CustomException(
        ErrorReturn.fromJson(jsonDecode(response.body)).errorMessage);
  } else
    print("no connection to anythin");
  throw Exception("Could not connect to backend");
}
