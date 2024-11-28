import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:novelty_app/common/utils/decode.dart';
import 'package:novelty_app/error/exceptions.dart';
import 'package:novelty_app/features/chat/data/datasources/thread_remote_data_source.dart';
// import 'package:novelty_app/features/chat/data/datasource/threads_raw_data.dart';
import 'package:novelty_app/features/chat/domain/entities/thread.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class ThreadRemoteDataSourceImpl extends ThreadRemoteDataSource {
  final http.Client httpClient = http.Client();
  // final LocalAuthSource localAuthSource;

  ThreadRemoteDataSourceImpl(
      // this.localAuthSource
      );

  @override
  Future<Thread?>? createThread(Thread thread) async {
    throw UnimplementedError();
    // var payload = jsonEncode((Thread as Thread).toMap());

    // debugPrint(payload);

    // http.Response response = await httpClient
    //     .post(Uri.parse(EndPoints.fetchPosts),
    //         headers: {
    //           'Content-Type': 'application/json',
    //           'Authorization': 'Bearer $authToken',
    //           'refresh-token': refreshToken,
    //         },
    //         body: payload)
    //     .timeout(const Duration(seconds: 15));

    // debugPrint(response.body);

    // if (response.statusCode >= 200 && response.statusCode < 300) {
    //   return Thread.fromMap(decode(response.body));
    // } else {
    //   throw ServerException(message: parseApiError(response.body));
    // }
  }

  @override
  Future<bool?>? deleteThread(int id) async {
    http.Response response = await httpClient.post(
        Uri.parse('www.example.com/$id'),
        headers: {'Content-Type': 'application/json'});
    try {
      if (response.body.isNotEmpty) {
        return false;
      } else {
        return null;
      }
    } on PlatformException {
      return null;
    }
  }

  @override
  Future<List<Thread>?>? getAllThreads() async {
    http.Response response = await httpClient.get(
        Uri.parse("https://freetestapi.com/api/v1/Threads?limit=5"),
        headers: {
          'Content-Type': 'application/json',
        }).timeout(const Duration(seconds: 15));
    debugPrint(response.body);

    return compute(_parseItems, jsonEncode('[]'));

    // if (response.statusCode >= 200 && response.statusCode < 300) {
    //   debugPrint(response.body);
    //   // return compute(_parseItems, response.body);
    //   return compute(_parseItems, jsonEncode(ThreadsData));
    //   // return [];
    // } else {
    //   throw ServerException(message: parseApiError(response.body));
    // }
  }

  @override
  Future<Thread?>? getThread(int id) async {
    throw UnimplementedError();
    // http.Response response = await httpClient.get(
    //     Uri.parse('www.example.com/$id'),
    //     headers: {'Content-Type': 'application/json'});
    // try {
    //   if (response.statusCode == 200) {
    //     if (response.body.isNotEmpty) {
    //       // TODO: change back to 'response,body'
    //       // return Thread.fromMap(jsonDecode(response.body));
    //       return Thread.fromMap(const {});
    //     } else {
    //       return null;
    //     }
    //   } else {
    //     throw const ServerException();
    //   }
    // } on PlatformException {
    //   return null;
    // }
  }

  @override
  Future<Thread?>? updateThread(Thread thread) async {
    //   http.Response response = await httpClient.post(
    //       Uri.parse('www.example.com/'),
    //       headers: {'Content-Type': 'application/json'});
    //   try {
    //     if (response.body.isNotEmpty) {
    //       return Thread as Thread;
    //     } else {
    //       return null;
    //     }
    //   } on PlatformException {
    //     return null;
    //   }
    // }

    throw UnimplementedError();
  }
}

List<Thread> _parseItems(String responseBody) {
  final parsed = jsonDecode(responseBody) as List;
  List<Thread> result = [];
  for (dynamic item in parsed) {
    result.add(Thread.fromJson(item));
  }

  return result;
}
