class PasswordValidator {
  String? validate({String? password}) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password need to be more than 6 characters';
    }

    final alphanumeric = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+$');

    if (!alphanumeric.hasMatch(password)) {
      return 'Password need to be alphanumeric';
    }
    return null;
  }
}
