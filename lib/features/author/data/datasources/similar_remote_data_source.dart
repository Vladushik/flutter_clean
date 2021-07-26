import 'dart:convert';

import 'package:flutter_clean/core/error/exceptions.dart';
import 'package:flutter_clean/features/author/data/models/similar_model.dart';
import 'package:http/http.dart' as http;

abstract class SimilarRemoteDataSource {
  /// Calls the http:// endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<DatumModel> getSimilar(String name);
}

class SimilarRemoteDataSourceImpl implements SimilarRemoteDataSource {
  final http.Client client;

  SimilarRemoteDataSourceImpl({required this.client});

  @override
  Future<DatumModel> getSimilar(String name) =>
      _getSimilarFromUrl('https://tastedive.com/api/similar?q=$name');

  Future<DatumModel> _getSimilarFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return DatumModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
