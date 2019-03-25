import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (text, sink) {
      text.contains('@') && text.contains('.')
          ? sink.add(text)
          : sink.addError('Please enter a valid email.');
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (text, sink) {
      text.length > 8
          ? sink.add(text)
          : sink.addError('Password should have at least 8 characters!');
    },
  );
}
