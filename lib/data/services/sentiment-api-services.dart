import 'dart:convert';
import 'package:http/http.dart' as http;

class SentimentApiServices {
  Future<dynamic> analyzeSentiment(String text) async {
    final url = Uri.parse("https://api.tabularis.ai/");
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "text": text,
          "return_all_scores": true,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Response: $data");
        return data;
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
        throw Exception("Failed to analyze sentiment: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception occurred: $e");
      throw Exception("Error analyzing sentiment: $e");
    }
  }
}
