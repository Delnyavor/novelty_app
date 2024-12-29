import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:novelty_app/common/utils/decode.dart';
import 'package:novelty_app/error/exceptions.dart';
import 'package:novelty_app/features/books/data/datasource/book_remote_data_source.dart';
import 'package:novelty_app/features/books/data/datasource/books_raw_data.dart';
import 'package:novelty_app/features/books/domain/entities/book.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class BookRemoteDataSourceImpl extends BookRemoteDataSource {
  final http.Client httpClient = http.Client();
  // final LocalAuthSource localAuthSource;

  BookRemoteDataSourceImpl(
      // this.localAuthSource
      );

  @override
  Future<Book?>? createBook(Book book) async {
    throw UnimplementedError();
    // var payload = jsonEncode((Book as Book).toMap());

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
    //   return Book.fromMap(decode(response.body));
    // } else {
    //   throw ServerException(message: parseApiError(response.body));
    // }
  }

  @override
  Future<bool?>? deleteBook(int id) async {
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
  Future<List<Book>?>? getAllBooks() async {
    http.Response response = await httpClient.get(
        Uri.parse("https://freetestapi.com/api/v1/books?limit=5"),
        headers: {
          'Content-Type': 'application/json',
        }).timeout(const Duration(seconds: 15));
    debugPrint(response.body);

    // return compute(_parseItems, jsonEncode(booksData));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint(response.body);
      // return compute(_parseItems, response.body);
      return compute(_parseItems, jsonEncode(response.body));
      // return [];
    } else {
      throw ServerException(message: parseApiError(response.body));
    }
  }

  @override
  Future<Book?>? getBook(int id) async {
    throw UnimplementedError();
    // http.Response response = await httpClient.get(
    //     Uri.parse('www.example.com/$id'),
    //     headers: {'Content-Type': 'application/json'});
    // try {
    //   if (response.statusCode == 200) {
    //     if (response.body.isNotEmpty) {
    //       // TODO: change back to 'response,body'
    //       // return Book.fromMap(jsonDecode(response.body));
    //       return Book.fromMap(const {});
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
  Future<Book?>? updateBook(Book book) async {
    //   http.Response response = await httpClient.post(
    //       Uri.parse('www.example.com/'),
    //       headers: {'Content-Type': 'application/json'});
    //   try {
    //     if (response.body.isNotEmpty) {
    //       return Book as Book;
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

List<Book> _parseItems(String responseBody) {
  final parsed = jsonDecode(responseBody) as List;
  List<Book> result = [];
  for (dynamic item in parsed) {
    result.add(Book.fromJson(item));
  }

  return result;
}
