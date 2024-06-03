import 'dart:convert';

import 'package:effective_mobile/core/error/exception.dart';
import 'package:http/http.dart' as http;

import '../models/ticket_model.dart';

abstract class TicketRemoteDataSourse {
  /// Calls the https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<TicketModel>> getTicketList();
}

class TicketRemoteDataSourseImpl implements TicketRemoteDataSourse {
  final http.Client client;

  TicketRemoteDataSourseImpl({required this.client});

  @override
  Future<List<TicketModel>> getTicketList() async {
    try {
      const String url =
          "https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf";
      final response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        final List<dynamic> list = jsonBody["tickets"];
        return list.map((element) => TicketModel.fromJson(element)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      rethrow;
    }
  }
}
