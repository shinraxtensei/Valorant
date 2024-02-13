import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:valorant/srcs/models/map.dart';
import 'package:valorant/utils/constant.dart';

Future<List<Mape>> fetchMaps() async {
  final response = await http.get(Uri.parse('$baseUrl/maps'));

  if (response.statusCode == 200) {
    final dynamic decodedResponse = jsonDecode(response.body);

    if (decodedResponse.containsKey('data') &&
        decodedResponse['data'] is List) {
      List<Mape> agents = (decodedResponse['data'] as List)
          .map((json) => Mape.fromJson(json))
          .toList();
      return agents;
    } else {
      throw Exception(
          'Failed to parse Maps response: Data is not in the expected format');
    }
  } else {
    throw Exception('Failed to load Maps');
  }
}
