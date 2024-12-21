import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchMeaning(String word) async {
  final response = await http
      .get(Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word'));
  return json.decode(response.body);
}
