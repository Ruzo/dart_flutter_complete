mixin input_validations {
  final validateEmail = (text) => text.contains('@') && text.contains('.')
      ? null
      : 'Please enter a valid email.';

  final validatePassword = (text) =>
      text.length > 8 ? null : 'Password should have at least 8 characters!';
}
