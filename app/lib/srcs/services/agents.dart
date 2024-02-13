import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:valorant/srcs/models/agent.dart';
import 'package:valorant/utils/constant.dart';

Future<List<Agent>> fetchAgents() async {
  final response = await http.get(Uri.parse('$baseUrl/agents'));

  if (response.statusCode == 200) {
    final dynamic decodedResponse = jsonDecode(response.body);

    if (decodedResponse.containsKey('data') &&
        decodedResponse['data'] is List) {
      List<Agent> agents = (decodedResponse['data'] as List)
          .map((json) => Agent.fromJson(json))
          .toList();
      return agents;
    } else {
      throw Exception(
          'Failed to parse Agents response: Data is not in the expected format');
    }
  } else {
    throw Exception('Failed to load Agents');
  }
}
