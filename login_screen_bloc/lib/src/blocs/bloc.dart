import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../mixins/validators.dart';

class Bloc extends Object with Validators {
  final _emailController = StreamController<
      String>.broadcast(); // Good candidate for BehaviorSubject
  final _passwordController = StreamController<
      String>.broadcast(); // Good candidate for BehaviorSubject

  Function(String) get addToEmail => _emailController.sink.add;
  Function(String) get addToPassword => _passwordController.sink.add;

  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);
  Stream<Map> get validated => CombineLatestStream.combine2(
        emailStream,
        passwordStream,
        (e, p) => {"email": e, "password": p},
      );

  void handleSubmit(Map user) {
    String email = user["email"];
    String password = user["password"];
    print('Credentials: $email / $password');
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
