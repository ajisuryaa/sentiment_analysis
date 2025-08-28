import 'package:flutter_bloc/flutter_bloc.dart';

/// State = just an integer (length of text)
class TextLengthCubit extends Cubit<int> {
  TextLengthCubit() : super(0);

  /// Update the state with the length of given text
  void updateText(String text) {
    emit(text.length);
  }
}
