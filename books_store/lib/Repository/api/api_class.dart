import 'dart:convert';

import 'package:books_store/Repository/api/api_client.dart';
import 'package:books_store/Repository/model/book-store2.dart';
import 'package:books_store/Repository/model/book-store1.dart';
import 'package:books_store/Repository/model/book-store3.dart';
import 'package:books_store/Repository/model/book-store4.dart';
import 'package:http/http.dart';

class Bookstoreapi {
  ApiClient apiClient = ApiClient();

  Future<Bookstoremodel1> postBookstore(
    String title,
    String author,
    int publishYear,
  ) async {
    String trendingpath = 'http://192.168.1.102:3000/books';
    var body = {"title": title, "author": author, "publishYear": publishYear};
    Response response = await apiClient.invokeAPI(
      trendingpath,
      'POST',
      jsonEncode(body),
    );

    return Bookstoremodel1.fromJson(jsonDecode(response.body));
  }

  //2
  Future<Bookstoremodel2> getbookstore() async {
    String trendingpath = 'http://192.168.1.102:3000/books';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Bookstoremodel2.fromJson(jsonDecode(response.body));
  }

  //3
  Future<Bookstoremodel3> updateBookstore(
    String id,
    String title,
    String author,
    int publishYear,
  ) async {
    String trendingpath = 'http://192.168.1.131:3000/books/$id';
    var body = {"title": title, "author": author, "publishYear": publishYear};
    Response response = await apiClient.invokeAPI(
      trendingpath,
      'PUT',
      jsonEncode(body),
    );

    return Bookstoremodel3.fromJson(jsonDecode(response.body));
  }
  //4
  Future<Bookstoremodel4> deletebookstore(String id) async {
    String trendingpath = 'http://192.168.1.131:3000/books/$id';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'DELETE', body);

    return Bookstoremodel4.fromJson(jsonDecode(response.body));
  }

}
