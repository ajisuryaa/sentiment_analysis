import 'package:sentiment_analysis/data/model/analysis_result.dart';

class Output {
  final String inferenceTime;
  final String model;
  final List<Result> results;
  final int textsProcessed;

  Output({
    required this.inferenceTime,
    required this.model,
    required this.results,
    required this.textsProcessed,
  });

  factory Output.fromJson(Map<String, dynamic> json) {
    return Output(
      inferenceTime: json['inference_time'] ?? '',
      model: json['model'] ?? '',
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e))
          .toList(),
      textsProcessed: json['texts_processed'] ?? 0,
    );
  }
}
