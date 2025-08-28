import 'dart:convert';
import 'package:http/http.dart' as http;

class SentimentApiServices {
  Future<void> analyzeSentiment(String text) async {
    final url = Uri.parse("https://api.tabularis.ai/");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "text": text,
        "return_all_scores": false,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Response: $data");
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
    }
  }
}
