import 'dart:convert';
import 'package:effective_mobile/features/home/data/models/music_event_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

abstract class HomeRemoteDataSource {
  /// Calls the https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MusicEventModel>> getMusicEventList();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MusicEventModel>> getMusicEventList() async {
    try {
      String url =
          "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd";
      final response = await client.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        final List<dynamic> musicEvents = jsonBody['offers'];
        return musicEvents
            .map((music) => MusicEventModel.fromJson(music))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      rethrow;
    }
  }
}
