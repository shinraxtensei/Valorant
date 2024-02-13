import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:valorant/srcs/models/gun.dart';
import 'package:valorant/utils/constant.dart';

Future<List<Gun>> fetchGuns() async {
  final response = await http.get(Uri.parse('$baseUrl/weapons'));

  if (response.statusCode == 200) {
    final dynamic decodedResponse = jsonDecode(response.body);

    if (decodedResponse.containsKey('data') &&
        decodedResponse['data'] is List) {
      List<Gun> guns = (decodedResponse['data'] as List)
          .map((json) => Gun.fromJson(json))
          .toList();
      return guns;
    } else {
      throw Exception(
          'Failed to parse guns response: Data is not in the expected format');
    }
  } else {
    throw Exception('Failed to load guns');
  }
}
