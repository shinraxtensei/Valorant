import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:valorant/srcs/models/agent.dart';

Future<Agent> fetchAgents() async {
  final response =
      await http.get(Uri.parse('${dotenv.env['API_BASE_URL']}/agents'));
  if (response.statusCode == 200) {
    return Agent.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load Agents');
  }
}
