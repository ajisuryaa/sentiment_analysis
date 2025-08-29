part of 'analyzer_sentiment_bloc.dart';

abstract class SentimentAnalyzerState extends Equatable {
  const SentimentAnalyzerState();

  @override
  List<Object?> get props => [];
}

class SentimentAnalyzerInitial extends SentimentAnalyzerState {
  const SentimentAnalyzerInitial();
}

class SentimentAnalyzerLoading extends SentimentAnalyzerState {
  const SentimentAnalyzerLoading();
}

class SentimentAnalyzerSuccess extends SentimentAnalyzerState {
  final SentimentResponse sentimentResponse;
  const SentimentAnalyzerSuccess({required this.sentimentResponse});

  @override
  List<Object?> get props => [sentimentResponse];
}

class SentimentAnalyzerError extends SentimentAnalyzerState {
  final String message;
  const SentimentAnalyzerError({required this.message});

  @override
  List<Object?> get props => [message];
}
