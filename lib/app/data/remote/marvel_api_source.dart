// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

class MarvelApiSource extends GetConnect {
  String public_key = "fea4ddbf370376865724c2b03db5ffef";
  String private_key = "dcca949708ec8a3a3b97cf51cacf65cd98a314c4";

  final String _baseUrl = 'https://gateway.marvel.com:443';
  final String _characters = '/v1/public/characters';
  final String _comics = '/v1/public/comics';

  @override
  void onInit() {
    httpClient.baseUrl = _baseUrl;
    httpClient.timeout = Duration(seconds: 30);

    /// SI la autenticacion se hiciera en headers podria usar este metodo para
    /// modificar cada request y asi enviar un token almacenado o generado como
    /// generateHash()

    // httpClient.addRequestModifier<Object?>((request) async {
    //   request.headers['Authorization'] = "Bearer " + generateHash();
    //   return request;
    // });

    super.onInit();
  }

  Map<String, dynamic> generateQueryWithHash() {
    Map<String, dynamic> query = {};

    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String hash = md5
        .convert(utf8.encode('$timestamp$private_key$public_key'))
        .toString();

    query["apikey"] = public_key;
    query["hash"] = hash;
    query["ts"] = timestamp.toString();

    return query;
  }

  /// This method returns paginated characters
  Future<Map> characters(
      {offset = 0, int? comicId, required String text}) async {
    Map<String, dynamic> query = generateQueryWithHash();
    query["offset"] = offset.toString();
    if (comicId != null) query["comics"] = comicId.toString();
    if (text != "") query["nameStartsWith"] = text;

    Response response = await get(_characters, query: query);
    // print(response.request!.url);

    return _response(response);
  }

  /// This metod returns paginated comics
  Future<Map> comics({offset = 0}) async {
    Map<String, dynamic> query = generateQueryWithHash();
    query["offset"] = offset.toString();

    Response response = await get(_comics, query: query);
    // print(response.request!.url);

    return _response(response);
  }

  Future<Map> characterComics(int id, {offset = 0}) async {
    Map<String, dynamic> query = generateQueryWithHash();

    query["offset"] = offset.toString();

    Response response =
        await get('${_characters}/${id}/comics', query: query, headers: {
      "Content-Type": "application/json-patch+json",
      "accept": "application/json",
    });
    return _response(response);
  }

  Future<Map> characterEvents(int id, {offset = 0}) async {
    Map<String, dynamic> query = generateQueryWithHash();
    query["offset"] = offset.toString();

    Response response =
        await get('${_characters}/${id}/events', query: query, headers: {
      "Content-Type": "application/json-patch+json",
      "accept": "application/json",
    });
    return _response(response);
  }

  Future<Map> characterSeries(int id, {offset = 0}) async {
    Map<String, dynamic> query = generateQueryWithHash();
    query["offset"] = offset.toString();

    Response response =
        await get('${_characters}/${id}/series', query: query, headers: {
      "Content-Type": "application/json-patch+json",
      "accept": "application/json",
    });
    return _response(response);
  }

  Future<Map> characterStories(int id, {offset = 0}) async {
    Map<String, dynamic> query = generateQueryWithHash();
    query["offset"] = offset.toString();

    Response response =
        await get('${_characters}/${id}/stories', query: query, headers: {
      "Content-Type": "application/json-patch+json",
      "accept": "application/json",
    });
    return _response(response);
  }

  Map _response(Response response, {bool showNotification = true}) {
    Map r = response.body;

    switch (response.statusCode) {
      case 400:
        response.printError();
        return r;
      case 404:
        response.printError();
        return r;
      case 500:
        response.printError();
        return r;
      default:
        return r;
    }
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}
