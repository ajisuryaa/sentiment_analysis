import 'package:sentiment_analysis/data/model/analysis_output.dart';

class SentimentResponse {
  final int delayTime;
  final int executionTime;
  final String id;
  final Output output;
  final String status;
  final String workerId;

  SentimentResponse({
    required this.delayTime,
    required this.executionTime,
    required this.id,
    required this.output,
    required this.status,
    required this.workerId,
  });

  factory SentimentResponse.fromJson(Map<String, dynamic> json) {
    return SentimentResponse(
      delayTime: json['delayTime'] ?? 0,
      executionTime: json['executionTime'] ?? 0,
      id: json['id'] ?? '',
      output: Output.fromJson(json['output']),
      status: json['status'] ?? '',
      workerId: json['workerId'] ?? '',
    );
  }
}
