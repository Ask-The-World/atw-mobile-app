import 'dart:convert';
import 'storage.dart';
import 'package:http/http.dart' as http;

class GetConfig {
  final int minTime;
  final int maxTime;
  final int defaultTime;
  final int maxQuestionLength;
  GetConfig(
      {this.minTime, this.maxTime, this.defaultTime, this.maxQuestionLength});

  factory GetConfig.fromJson(Map<String, dynamic> json) {
    return GetConfig(
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

Future<GetConfig> fetchGetConfig() async {
  final response = await http.get('http://192.168.1.105/api/get/config');

  if (response.statusCode == 200) {
    print('Successfull connection (200)');
    return GetConfig.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 500) {
    print("error connection (500)");
    throw CustomException(
        ErrorReturn.fromJson(jsonDecode(response.body)).errorMessage);
  } else
    print("no connection to anything");
  throw Exception("Could not connect to backend");
}

GetConfig getConfig() {
  storageGetString("gotConfigVars").then((result) {
    if (result != "True") {
      GetConfig config;
      fetchGetConfig().then((configuration) {
        config = configuration;
        storageSetString("gotConfigVars", "True");
        storageSetInt("minTime", config.minTime);
        storageSetInt("maxTime", config.maxTime);
        storageSetInt("defaultTime", config.defaultTime);
        storageSetInt("maxQuestionLenght", config.maxQuestionLength);
        return config;
      }).catchError((error) {
        storageSetString("gotConfigVars", "False");
        storageSetInt("minTime", 20);
        storageSetInt("maxTime", 120);
        storageSetInt("defaultTime", 60);
        storageSetInt("maxQuestionLength", 255);
        print("error getting config from server: $error");
        return GetConfig(
            defaultTime: 60, minTime: 20, maxTime: 120, maxQuestionLength: 255);
      });
    } else {
      return GetConfig(
          defaultTime: storageGetInt("defaultTime"),
          maxQuestionLength: storageGetInt("maxQuestionLength"),
          minTime: storageGetInt("minTime"),
          maxTime: storageGetInt("maxTime"));
    }
  }).catchError((error) {
    storageSetString("gotConfigVars", "False");
    storageSetInt("minTime", 20);
    storageSetInt("maxTime", 120);
    storageSetInt("defaultTime", 60);
    storageSetInt("maxQuestionLength", 255);
    print("error getting config from server: $error");
    return GetConfig(
        defaultTime: 60, minTime: 20, maxTime: 120, maxQuestionLength: 255);
  });
  return GetConfig(
      defaultTime: 60, minTime: 20, maxTime: 120, maxQuestionLength: 255);
}
