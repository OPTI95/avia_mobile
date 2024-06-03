import 'dart:convert';
import 'package:effective_mobile/features/search/data/models/search_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

abstract class SearchRemoteDataSource {
  /// Calls the https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017 endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<SearchModel>> getListSearchTickets();
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final http.Client client;

  SearchRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SearchModel>> getListSearchTickets() async {
    try {
      const String url =
          "https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017";
      final response = await client.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        final List<dynamic> searchEvents = jsonBody["tickets_offers"];
        return searchEvents
            .map((search) => SearchModel.fromJson(search))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      rethrow;
    }
  }
}
