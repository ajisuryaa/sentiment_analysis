part of 'analyzer_sentiment_bloc.dart';

abstract class SentimentAnalyzerEvent extends Equatable {
  const SentimentAnalyzerEvent();

  @override
  List<Object?> get props => [];
}

class AnalyzingText extends SentimentAnalyzerEvent {
  final String inputedText;

  const AnalyzingText({
    required this.inputedText,
  });

  @override
  List<Object?> get props => [inputedText];
}
